variable "cloudfront_distribution_domain_name" {
  type        = string
  description = "The domain name of the CloudFront distribution"
}

variable "cloudfront_distribution_zone_id" {
  type        = string
  description = "The ID of the CloudFront distribution"
}

variable "root_domain_name" {
  default = "todo.kelyinc.xyz"
}

variable "www_domain_name" {
  default = "www.todo.kelyinc.xyz"
}
