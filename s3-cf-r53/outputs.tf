output "a_record" {
  description = "The Route 53 A record for the app"
  value       = aws_route53_record.subdomain_alias.fqdn
}

output "distribution_id" {
  description = "The CloudFront distribution ID"
  value       = aws_cloudfront_distribution.app_distribution.id
}

output "distribution_url" {
  description = "The CloudFront distribution domain name (URL)"
  value       = aws_cloudfront_distribution.app_distribution.domain_name
}

output "s3_bucket_name" {
  description = "The name of the S3 bucket used for the app"
  value       = aws_s3_bucket.app_bucket.bucket
}
