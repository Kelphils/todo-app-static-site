// Create a variable for your domain name because we'll be using it a lot.
variable "bucket_domain_name" {
  default = "www-todo-kelyinc-xyz"
}

// We'll also need the root domain (also known as zone apex or naked domain).
variable "root_domain_name" {
  default = "todo.kelyinc.xyz"
}

variable "project" {
  description = "Project Environment"
  type        = string
  default     = "static-website-hosting"
}

variable "Owner" {
  description = "The owner of the resources"
  type        = string
  default     = "Kelvin Obioha"
}

variable "cloudfront_origin_access_identity_iam_arn" {
  type        = string
  description = "The ARN of the CloudFront origin access identity"
}
