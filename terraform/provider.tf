terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "static-website-hosting-terraform-state"
    key    = "modules/static-hosting/terraform.tfstate"

  }
}


provider "aws" {
  alias  = "acm_provider"
  region = "us-east-1"
}

#  configure the aws provider
provider "aws" {
  region = "us-east-1"
  # profile = "default"
  default_tags {
    tags = {
      terraform = "ManagedBy-${var.Owner}-${var.project}"
    }
  }
}
