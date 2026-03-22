output "bucket_name" {
  description = "Name of the S3 bucket hosting the portfolio."
  value       = aws_s3_bucket.portfolio.bucket
}

output "bucket_arn" {
  description = "ARN of the S3 bucket hosting the portfolio."
  value       = aws_s3_bucket.portfolio.arn
}

output "website_endpoint" {
  description = "S3 website endpoint for the portfolio."
  value       = aws_s3_bucket_website_configuration.portfolio.website_endpoint
}

output "website_url" {
  description = "HTTP URL for the S3-hosted portfolio website."
  value       = "http://${aws_s3_bucket_website_configuration.portfolio.website_endpoint}"
}

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
