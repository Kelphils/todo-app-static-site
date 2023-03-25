output "s3_bucket_name" {
  value       = module.s3.bucket_name
  description = "The name of the bucket"
}

output "cloudfront_distribution_domain_name" {
  value       = module.cloudfront.cloudfront_distribution_domain_name
  description = "The domain name of the CloudFront distribution"
}

output "cloudfront_distribution_id" {
  value       = module.cloudfront.cloudfront_distribution_id
  description = "The ID of the CloudFront distribution"
}

output "cloudfront_origin_access_identity_iam_arn" {
  value       = module.cloudfront.cloudfront_origin_access_identity_iam_arn
  description = "The IAM ARN of the CloudFront origin access identity"
}
