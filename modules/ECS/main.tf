resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.project}-ecs-cluster-${var.environment}"
  tags = merge(var.common_tags,
    {
      "Name" = "${var.project}-ecs_cluster-${var.environment}"
    },
  )
}

resource "aws_cloudwatch_log_group" "backned_log_group" {
  name              = "${var.project}-ecs-backend-lg-${var.environment}"
  retention_in_days = 30

  tags = merge(
    var.common_tags,
    {
      "Name" = "${var.project}-ecs-loggroup-backend-${var.environment}"
    },
  )
}

data "template_file" "ecs_backend_template" {
  template = file("modules/ECS/task-definitions/backend.json")

  vars = {
    account_id = var.account_id
    project = var.project
    region = var.region
    backend_ecr_repo = var.backend_ecr_repo
    backend_image_tag = var.backend_image_tag
    backend_memory = var.backend_memory
    backend_cpu = var.backend_cpu
    backend_container_port = var.backend_container_port
    cloudwatch_logs_group = aws_cloudwatch_log_group.backned_log_group.name
  }
}

resource "aws_ecs_task_definition" "application_ecs_backend_task_definition" {
  family                        = "${var.project}-backend-${var.environment}"
  execution_role_arn            = var.ecs_backend_role_arn
  task_role_arn                 = var.ecs_backend_role_arn
  network_mode                  = "awsvpc"
  requires_compatibilities      = [var.ecs_launch_type]
  cpu                           = var.backend_cpu
  memory                        = var.backend_memory
  container_definitions         = data.template_file.ecs_backend_template.rendered

  tags = merge(var.common_tags,
    {
      "Name" = "${var.project}-ecs-backend-task-definition-${var.environment}"
    },
  )
}


resource "aws_ecs_service" "application_ecs_backend_service" {
  name                = "${var.project}-ecs-backend-service-${var.environment}"
  cluster             = aws_ecs_cluster.ecs_cluster.id
  task_definition     = aws_ecs_task_definition.application_ecs_backend_task_definition.arn
  launch_type         = var.ecs_launch_type
  scheduling_strategy = var.ecs_backend_scheduling_strategy
  desired_count       = var.ecs_backend_desired_count

  network_configuration {
    security_groups  = [var.backend_security_group]
    subnets          = var.private_subnet_ids
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.backend_lb_target_group_arn
    container_name = var.project
    container_port = var.backend_container_port
  }

  lifecycle {
    ignore_changes = [desired_count]
  }
}