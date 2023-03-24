provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      terraform = "ManagedBy-${var.Owner}-${var.project}"
    }
  }
}
# s3 bucket to store terraform state
resource "aws_s3_bucket" "terraform_state" {
  bucket = "static-website-hosting-terraform-state"
  # force_destroy = true


  # Prevent accidental deletion of this S3 bucket
  lifecycle {
    prevent_destroy = true
  }
}

# Enable versioning so you can see the full revision history of your
# state files
resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption by default
resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Explicitly block all public access to the S3 bucket
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.terraform_state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# DynamoDb locking by creating DynamoDb table for storing state with primary key of "LockID" to prevent concurrent runs
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "static-website-hosting-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

# backend configuration for the terraform state in S3 bucket with the DynamoDb table as the backend and encryption, locking enabled
terraform {
  required_version = ">= 1.0.0, < 2.0.0"
  # backend "s3" {
  #   # Replace this with your bucket name!
  #   bucket = "alt-school-third-project-terraform-state"
  #   key    = "global/s3/terraform.tfstate"
  #   region = "us-east-1"

  #   # Replace this with your DynamoDB table name!
  #   dynamodb_table = "static-website-hosting-table"
  #   encrypt        = true
  # }
}
