output "cloudfront_distribution_domain_name" {
  value       = aws_cloudfront_distribution.static-website-hosting-cdn-distribution.domain_name
  description = "The domain name of the CloudFront distribution"
}

output "cloudfront_distribution_zone_id" {
  value       = aws_cloudfront_distribution.static-website-hosting-cdn-distribution.hosted_zone_id
  description = "The ID of the CloudFront distribution"
}
