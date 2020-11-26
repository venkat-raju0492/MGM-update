output "backend_sg_id" {
  value = aws_security_group.ecs_backend_sg.id
}

output "backend_role_arn" {
  value = aws_iam_role.ecs_backend_task_role.arn
}

output "backend_lb_sg_id" {
  value = aws_security_group.backend-lb-sg.id
}
