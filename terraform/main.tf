# run the command below to specify the path for configuration of the
# terraform state in S3 bucket with the DynamoDb table as the backend and encryption, locking enabled
# terraform init -backend-config=backend.hcl

module "s3" {
  source = "./modules/s3"

}

module "acm" {
  source = "./modules/acm"

}

module "cloudfront" {
  source                     = "./modules/cloudfront"
  acm_certificate_arn        = module.acm.acm_certificate_arn
  s3_bucket_website_endpoint = module.s3.bucket_website_endpoint

}

module "dns" {
  source = "./modules/dns"

}
