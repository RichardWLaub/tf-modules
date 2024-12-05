variable "bucket_name" {
  description = "The name of the S3 bucket for the React app"
  type        = string
}

variable "certificate_id" {
  description = "The unique identifier for the ACM certificate"
  type        = string
}

variable "default_root_object" {
  description = "The default root object for the CloudFront distribution"
  type        = string
  default     = "index.html"
}

variable "domain_name" {
  description = "The base domain name"
  type        = string
}

variable "subdomain" {
  description = "The subdomain for the application"
  type        = string
}
