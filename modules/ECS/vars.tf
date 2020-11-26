variable "project" {
  description = "name of the project"
}

variable "environment" {
  description = "name of the environment"
}

variable "common_tags" {
  description = "common tags for all resources"
  type = map
}

variable "account_id" {
  description = "aws account id"
}

variable "region" {
  description = "aws region"
}

variable "private_subnet_ids" {
  description = "vpc private subnet ids"
  type = list
}

variable "backend_ecr_repo" {
  description = "backend ecr repo"
}

variable "backend_image_tag" {
  description = "backend image ecr tag"
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

variable "ecs_backend_desired_count" {
  description = "ecs backend desired no. of containers"
}

variable "ecs_backend_scheduling_strategy" {
  description = "backend service scheduling strategy"
}

variable "backend_security_group" {
  description = "backend security group id"
}

variable "ecs_launch_type" {
  description = "ecs launch type"
}


variable "ecs_backend_role_arn" {
  description = "ecs backend task def role arn"
}


variable "backend_lb_target_group_arn" {
  description = "baclend load balancer target group arn"
}