variable "region" {
  description = "aws region"
}

variable "project" {
  description = "name of the project"
}

variable "environment" {
  description = "name of the environment"
}

#variable "domain_name" {
#  description = "domain name"
#}

#variable "cf_certificate_arn_no" {
#  description = "certificate arn no for cloudfront"
#}

#variable "waf_cidr_allowlist" {
#  description = "waf allowed list cidr"
#  type = list
#}

#variable "ssl_method" {
#  description = "ssl method for cloud front"
#}

#variable "protocol_version" {
#  description = "protocal version for cloudfront"
#}

variable "allow_methods" {
  description = "cloudfront allowed methods"
  type = list
}

variable "cache_methods" {
  description = "cache methods for cloud front"
  type = list
}

variable "s3_acl_bucket" {
  description = "s3 acl bucket"
}

variable "static_s3_expiration_days" {
  description = "static s3 bucket expiration days"
}