project = "test"
region = "us-west-2"
environment = "dev"
#domain_name = "mgm.com"
#cf_certificate_arn_no = ""
#waf_cidr_allowlist = ["0.0.0.0/"]
#ssl_method = "sni-only"
#protocol_version = "TLSv1.2_2019"
s3_acl_bucket = "private"
allow_methods = ["HEAD", "DELETE", "POST", "GET", "OPTIONS", "PUT", "PATCH"]
cache_methods = ["GET","HEAD"]
static_s3_expiration_days = "90"
vpc_id = ""
backend_allowed_cidrs = []
backend_lb_allowed_cidrs = []
deregistration_delay = "20"
health_check_path = ""
public_subnet_ids = []
certificate_arn_no = ""
ecs_launch_type = "FARGATE"
private_subnet_ids = []
backend_ecr_repo = ""
backend_image_tag = ""
backend_memory = ""
backend_cpu = ""
backend_container_port = ""
ecs_backend_scheduling_strategy = "REPLICA"
ecs_backend_desired_count = "1"