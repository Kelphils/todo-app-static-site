// We want AWS to host our zone so its nameservers can point to our CloudFront
// distribution.

#DNS Configuration
#Get already , publicly configured Hosted Zone on Route53 - MUST EXIST

data "aws_route53_zone" "base_dns" {
  name = var.root_domain_name
  tags = {
    Name = "todo_app_dns_zone"
  }
}
// This Route53 record will point at our CloudFront distribution.
resource "aws_route53_record" "root_record" {
  zone_id = data.aws_route53_zone.base_dns.zone_id
  name    = var.root_domain_name
  type    = "A"

  alias {
    name                   = var.cloudfront_distribution_domain_name
    zone_id                = var.cloudfront_distribution_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_record" {
  zone_id = data.aws_route53_zone.base_dns.zone_id
  name    = var.www_domain_name
  type    = "A"

  alias {
    name                   = var.cloudfront_distribution_domain_name
    zone_id                = var.cloudfront_distribution_zone_id
    evaluate_target_health = false
  }
}
