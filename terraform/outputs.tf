output "s3_bucket_name" {
  value       = module.s3.bucket_name
  description = "The name of the bucket"
}

output "cloudfront_distribution_domain_name" {
  value       = module.cloudfront.cloudfront_distribution_domain_name
  description = "The domain name of the CloudFront distribution"
}
