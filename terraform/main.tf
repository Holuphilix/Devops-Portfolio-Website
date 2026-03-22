provider "aws" {
  region = var.aws_region
}

locals {
  cloudfront_origin_id = "s3-website-${aws_s3_bucket.portfolio.bucket}"

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket" "portfolio" {
  bucket        = var.bucket_name
  force_destroy = var.force_destroy

  tags = local.common_tags
}

resource "aws_s3_bucket_ownership_controls" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id

  index_document {
    suffix = var.index_document
  }

  error_document {
    key = var.error_document
  }
}

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

resource "aws_s3_bucket_policy" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id
  policy = data.aws_iam_policy_document.portfolio_public_read.json

  depends_on = [
    aws_s3_bucket_public_access_block.portfolio
  ]
}

data "aws_cloudfront_cache_policy" "caching_optimized" {
  name = "Managed-CachingOptimized"
}

resource "aws_cloudfront_distribution" "portfolio" {
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CloudFront distribution for ${var.project_name}"
  default_root_object = var.index_document
  price_class         = var.cloudfront_price_class

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
    cloudfront_default_certificate = true
  }

  tags = local.common_tags
}
