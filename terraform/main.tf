# Primary AWS provider for regional resources such as S3.
provider "aws" {
  region = var.aws_region
}

# ACM certificates for CloudFront must be created in us-east-1.
provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}

# Shared local values used across the stack.
locals {
  cloudfront_origin_id = "s3-website-${aws_s3_bucket.portfolio.bucket}"
  custom_domain_names = distinct(
    compact(concat([var.primary_domain_name], var.alternate_domain_names))
  )
  custom_domain_enabled = var.enable_custom_domain && length(local.custom_domain_names) > 0

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# Static website bucket for the portfolio assets.
resource "aws_s3_bucket" "portfolio" {
  bucket        = var.bucket_name
  force_destroy = var.force_destroy

  tags = local.common_tags
}

# Enforce bucket-owner control over uploaded objects.
resource "aws_s3_bucket_ownership_controls" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

# Allow the bucket to serve the public static website content.
resource "aws_s3_bucket_public_access_block" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Configure the bucket for static website hosting.
resource "aws_s3_bucket_website_configuration" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id

  index_document {
    suffix = var.index_document
  }

  error_document {
    key = var.error_document
  }
}

# Build the public-read bucket policy document for website objects.
data "aws_iam_policy_document" "portfolio_public_read" {
  statement {
    sid    = "PublicReadAccess"
    effect = "Allow"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = ["s3:GetObject"]

    resources = [
      "${aws_s3_bucket.portfolio.arn}/*"
    ]
  }
}

# Attach the public-read bucket policy to the website bucket.
resource "aws_s3_bucket_policy" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id
  policy = data.aws_iam_policy_document.portfolio_public_read.json

  depends_on = [
    aws_s3_bucket_public_access_block.portfolio
  ]
}

# Reuse the AWS-managed optimized caching policy for CloudFront.
data "aws_cloudfront_cache_policy" "caching_optimized" {
  name = "Managed-CachingOptimized"
}

# TLS certificate request for the root domain and any alternate domain names.
resource "aws_acm_certificate" "portfolio" {
  count    = length(local.custom_domain_names) > 0 ? 1 : 0
  provider = aws.virginia

  domain_name       = var.primary_domain_name
  validation_method = "DNS"

  subject_alternative_names = var.alternate_domain_names

  lifecycle {
    create_before_destroy = true
  }

  tags = local.common_tags
}

# Confirms the ACM certificate once the DNS validation records are created in Namecheap.
resource "aws_acm_certificate_validation" "portfolio" {
  count    = local.custom_domain_enabled ? 1 : 0
  provider = aws.virginia

  certificate_arn = aws_acm_certificate.portfolio[0].arn
  validation_record_fqdns = [
    for option in aws_acm_certificate.portfolio[0].domain_validation_options : option.resource_record_name
  ]
}

# CloudFront distribution that fronts the S3 static website endpoint.
resource "aws_cloudfront_distribution" "portfolio" {
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CloudFront distribution for ${var.project_name}"
  default_root_object = var.index_document
  price_class         = var.cloudfront_price_class

  aliases = local.custom_domain_enabled ? local.custom_domain_names : []

  origin {
    domain_name = aws_s3_bucket_website_configuration.portfolio.website_endpoint
    origin_id   = local.cloudfront_origin_id

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = local.cloudfront_origin_id
    compress         = true

    viewer_protocol_policy = "redirect-to-https"
    cache_policy_id        = data.aws_cloudfront_cache_policy.caching_optimized.id
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = local.custom_domain_enabled ? false : true
    acm_certificate_arn            = local.custom_domain_enabled ? aws_acm_certificate_validation.portfolio[0].certificate_arn : null
    ssl_support_method             = local.custom_domain_enabled ? "sni-only" : null
    minimum_protocol_version       = local.custom_domain_enabled ? "TLSv1.2_2021" : null
  }

  lifecycle {
    precondition {
      condition     = !var.enable_custom_domain || length(local.custom_domain_names) > 0
      error_message = "Set primary_domain_name and alternate_domain_names before enabling the custom domain."
    }
  }

  tags = local.common_tags
}
