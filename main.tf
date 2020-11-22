provider "aws" {
  region = var.region
}

data "aws_caller_identity" "current" {}

data "aws_canonical_user_id" "current" {}

locals {
  cloudfront_origin_access_identity = "access-identity-${var.project}-static-s3-${var.environment}.s3.amazonaws.com"
  fqdn = "S3-${var.project}-static-s3-${var.environment}"
  #cname = ["${var.project}-frontend-${var.environment}.${var.domain_name}"]
  s3bucket_domain_name = "${var.project}-static-s3-${var.environment}.s3.amazonaws.com"
  account_id = data.aws_caller_identity.current.account_id
  #cert_arn = "arn:aws:acm:us-east-1:${local.account_id}:certificate/${var.cf_certificate_arn_no}"
  common_tags = {
    Project     = var.project
    Environment = var.environment
    CreatedBy   = "Terraform"
  }
}

#module "WAF" {
#  source                    = "./modules/WAF/"
#  project                   = var.project
#  environment               = var.environment
#  waf_cidr_allowlist        = var.waf_cidr_allowlist
#}

module "cloudfront" {
  source                            = "./modules/CloudFront/"
  bucket_regional_domain_name       = local.s3bucket_domain_name
  cloudfront_origin_access_identity = local.cloudfront_origin_access_identity
  fqdn                              = local.fqdn
  common_tags                       = local.common_tags
  project                           = var.project
  environment                       = var.environment
  cloudfront_default_certificate    = true
  #aliases                           = local.cname
  #cert_arn                          = local.cert_arn
  #ssl_method                        = var.ssl_method
  #protocol_version                  = var.protocol_version
  allow_methods                     = var.allow_methods
  cache_methods                     = var.cache_methods
  #waf_acl_id                        = module.WAF.waf_acl_id
}

module "static-s3" {
  source                            = "./modules/S3/"
  environment                       = var.environment
  project                           = var.project
  s3_bucket                         = "static-s3"
  common_tags                       = local.common_tags
  expiration_days                   = var.static_s3_expiration_days
  cf_canonical_user_id              = module.cloudfront.cf_arn
  s3_acl_bucket                     = var.s3_acl_bucket
}
