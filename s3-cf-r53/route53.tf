# Reference to your existing hosted zone
data "aws_route53_zone" "domain_zone" {
  name         = "${var.domain_name}."
  private_zone = false
}

# Create an alias record that points to the CloudFront distribution
resource "aws_route53_record" "subdomain_alias" {
  zone_id = data.aws_route53_zone.domain_zone.zone_id
  name    = "${var.subdomain}.${var.domain_name}"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.app_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.app_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}
