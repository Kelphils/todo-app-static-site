output "cloudfront_distribution_domain_name" {
  value       = aws_cloudfront_distribution.static-website-hosting-cdn-distribution.domain_name
  description = "The domain name of the CloudFront distribution"
}

output "cloudfront_distribution_zone_id" {
  value       = aws_cloudfront_distribution.static-website-hosting-cdn-distribution.hosted_zone_id
  description = "The ID of the CloudFront distribution"
}

output "cloudfront_distribution_id" {
  value       = aws_cloudfront_distribution.static-website-hosting-cdn-distribution.id
  description = "The ID of the CloudFront distribution"
}

output "cloudfront_origin_access_identity_iam_arn" {
  value       = aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn
  description = "The ARN of the CloudFront origin access identity"
}
