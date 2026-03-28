# AWS provider configuration.
variable "aws_region" {
  description = "AWS region where the portfolio infrastructure will be created."
  type        = string
  default     = "us-east-1"
}

# S3 bucket naming.
variable "bucket_name" {
  description = "Globally unique S3 bucket name for the static portfolio website."
  type        = string
  default     = "philipdev-portfolio-website"
}

# Shared project metadata tags.
variable "project_name" {
  description = "Project name used for resource tagging."
  type        = string
  default     = "devops-portfolio-website"
}

variable "environment" {
  description = "Environment tag for the deployment."
  type        = string
  default     = "prod"
}

# Static website entry documents.
variable "index_document" {
  description = "Default index document for the static website."
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "Error document for the static website."
  type        = string
  default     = "index.html"
}

# Bucket lifecycle behavior.
variable "force_destroy" {
  description = "Allow Terraform to delete the bucket even if it contains files."
  type        = bool
  default     = false
}

# CloudFront delivery settings.
variable "cloudfront_price_class" {
  description = "CloudFront price class for the CDN distribution."
  type        = string
  default     = "PriceClass_100"
}

# Custom domain settings for CloudFront and ACM.
variable "primary_domain_name" {
  description = "Primary custom domain for the portfolio, for example philipoludolamu.com."
  type        = string
  default     = ""
}

variable "alternate_domain_names" {
  description = "Additional custom domains for the portfolio, for example www.philipoludolamu.com."
  type        = list(string)
  default     = []
}

variable "enable_custom_domain" {
  description = "Enable the custom domain on CloudFront after ACM DNS validation records have been created."
  type        = bool
  default     = false
}
