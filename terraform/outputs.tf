# S3 bucket details.
output "bucket_name" {
  description = "Name of the S3 bucket hosting the portfolio."
  value       = aws_s3_bucket.portfolio.bucket
}

output "bucket_arn" {
  description = "ARN of the S3 bucket hosting the portfolio."
  value       = aws_s3_bucket.portfolio.arn
}

# Static website endpoint details.
output "website_endpoint" {
  description = "S3 website endpoint for the portfolio."
  value       = aws_s3_bucket_website_configuration.portfolio.website_endpoint
}

output "website_url" {
  description = "HTTP URL for the S3-hosted portfolio website."
  value       = "http://${aws_s3_bucket_website_configuration.portfolio.website_endpoint}"
}

# CloudFront delivery details.
output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID for cache invalidations."
  value       = aws_cloudfront_distribution.portfolio.id
}

output "cloudfront_domain_name" {
  description = "Default CloudFront domain name for the portfolio."
  value       = aws_cloudfront_distribution.portfolio.domain_name
}

output "cloudfront_url" {
  description = "HTTPS URL for the portfolio through CloudFront."
  value       = "https://${aws_cloudfront_distribution.portfolio.domain_name}"
}

output "custom_domain_names" {
  description = "Configured custom domain names for the portfolio."
  value       = local.custom_domain_names
}

output "custom_domain_enabled" {
  description = "Whether CloudFront is currently configured to serve the custom domain names."
  value       = local.custom_domain_enabled
}

output "acm_certificate_arn" {
  description = "ACM certificate ARN for the portfolio custom domain."
  value       = length(aws_acm_certificate.portfolio) > 0 ? aws_acm_certificate.portfolio[0].arn : null
}

output "acm_dns_validation_records" {
  description = "DNS validation records to create in Namecheap before enabling the custom domain."
  value = length(aws_acm_certificate.portfolio) > 0 ? [
    for option in aws_acm_certificate.portfolio[0].domain_validation_options : {
      domain_name  = option.domain_name
      record_name  = option.resource_record_name
      record_type  = option.resource_record_type
      record_value = option.resource_record_value
    }
  ] : []
}

output "namecheap_routing_records" {
  description = "Recommended Namecheap DNS records to point the root domain and www subdomain to CloudFront."
  value = length(local.custom_domain_names) > 0 ? [
    {
      host  = "@"
      type  = "ALIAS"
      value = aws_cloudfront_distribution.portfolio.domain_name
    },
    {
      host  = "www"
      type  = "CNAME"
      value = aws_cloudfront_distribution.portfolio.domain_name
    }
  ] : []
}
