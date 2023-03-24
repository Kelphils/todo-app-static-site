variable "s3_bucket_website_endpoint" {
  type        = string
  description = "The website endpoint of the S3 bucket"
}

variable "www_domain_name" {
  default = "www.todo.kelyinc.xyz"
}

variable "acm_certificate_arn" {
  type        = string
  description = "The ARN of the ACM certificate"
}

variable "root_domain_name" {
  default = "todo.kelyinc.xyz"
}
