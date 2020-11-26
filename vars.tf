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

variable "backend_lb_allowed_cidrs" {
  description = "frontend lb allowed cidrs"
  type = list
}

variable "backend_allowed_cidrs" {
  description = "backend allowed cidrs"
}

variable "deregistration_delay" {
  description = "load balancer deregistration delays"
}

variable "health_check_path" {
  description = "load balancer health check path"
}

variable "public_subnet_ids" {
  description = "public subnet ids"
}

variable "certificate_arn_no" {
  description = "certificate arn no for load balancer"
}

variable "ecs_launch_type" {
  description = "ecs launch type"
}

variable "private_subnet_ids" {
  description = "private subnet ids"
  type = list
}

variable "vpc_id" {
  description = "vpc id"
}

variable "backend_ecr_repo" {
  description = "backend ecr repo"
}

variable "backend_image_tag" {
  description = "backend container image tag"
}

variable "backend_memory" {
  description = "backend container memory"
}

variable "backend_cpu" {
  description = "backend container cpu"
}

variable "backend_container_port" {
  description = "backend container port"
}

variable "ecs_backend_scheduling_strategy" {
  description = "ecs backend scheduling strategy"
}

variable "ecs_backend_desired_count" {
  description = "ecs backend desired no. of containers"
}


