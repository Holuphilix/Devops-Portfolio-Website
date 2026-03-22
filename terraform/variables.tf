variable "aws_region" {
  description = "AWS region where the portfolio infrastructure will be created."
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Globally unique S3 bucket name for the static portfolio website."
  type        = string
  default     = "philipdev-portfolio-website"
}

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

variable "force_destroy" {
  description = "Allow Terraform to delete the bucket even if it contains files."
  type        = bool
  default     = false
}

variable "cloudfront_price_class" {
  description = "CloudFront price class for the CDN distribution."
  type        = string
  default     = "PriceClass_100"
}
