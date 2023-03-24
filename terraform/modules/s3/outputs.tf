
output "bucket_name" {
  value       = aws_s3_bucket.static-website-hosting.bucket_domain_name
  description = "The name of the bucket"
}

output "bucket_arn" {
  value       = aws_s3_bucket.static-website-hosting.arn
  description = "The ARN of the bucket"
}
