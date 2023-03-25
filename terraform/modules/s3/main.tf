data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "static-website-hosting" {
  // Our bucket's name is going to be the same as our site's domain name.
  bucket = var.bucket_domain_name
  // Because we want our site to be available on the internet, we set this so
  // anyone can read this bucket.
  force_destroy = true
  // We also need to create a policy that allows anyone to view the content.
  // This is basically duplicating what we did in the ACL but it's required by
  // AWS. This post: http://amzn.to/2Fa04ul explains why.
  #   policy = <<POLICY
  # {
  #   "Version":"2012-10-17",
  #   "Statement":[
  #     {
  #       "Sid":"AddPerm",
  #       "Effect":"Allow",
  #       "Principal": "*",
  #       "Action":["s3:GetObject"],
  #       "Resource":["arn:aws:s3:::${var.www_domain_name}/*"]
  #     }
  #   ]
  # }
  # POLICY

  // S3 understands what it means to host a website.
  # website {
  #   // Here we tell S3 what to use when a request comes in to the root
  #   // ex. https://www.runatlantis.io
  #   index_document = "index.html"
  #   // The page to serve up if a request results in an error or a non-existing
  #   // page.
  #   error_document = "404.html"
  # }
  tags = {
    Environment = "${var.project}-todo-app"
  }
}

resource "aws_s3_bucket_acl" "static-website-hosting" {
  bucket = aws_s3_bucket.static-website-hosting.id
  acl    = "public-read"
}

resource "aws_s3_bucket_cors_configuration" "static-website-hosting" {
  bucket = aws_s3_bucket.static-website-hosting.id

  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["https://www.${var.root_domain_name}"]
    max_age_seconds = 3000
  }

}

resource "aws_s3_bucket_website_configuration" "static-website-hosting" {
  bucket = aws_s3_bucket.static-website-hosting.id

  // Here we tell S3 what to use when a request comes in to the root
  // ex. https://www.todo.kelyinc.xyz
  index_document {
    suffix = "index.html"
  }
  // The page to serve up if a request results in an error or a non-existing
  // page.
  error_document {
    key = "index.html"
  }

  # routing_rule {
  #   condition {
  #     key_prefix_equals = "docs/"
  #   }
  #   redirect {
  #     replace_key_prefix_with = "documents/"
  #   }
  # }
}


data "aws_iam_policy_document" "s3_policy" {
  statement {
    sid       = "PublicReadGetObject"
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.static-website-hosting.arn}/*"]

    principals {
      type = "AWS"
      # identifiers = ["*"]
      # identifiers to only allow cloudfront to access s3 bucket



      identifiers = [var.cloudfront_origin_access_identity_iam_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.static-website-hosting.id
  policy = data.aws_iam_policy_document.s3_policy.json
}
