locals {
  asg_name = "${var.asg_name}-${var.environment}"
}

module "autoscaling" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "3.6.0"

  name = local.asg_name

  lc_name   = "${var.launch_config_name}-${var.environment}"
  create_lc = true
  image_id  = "ami-0a13d44dccf1f5cf6"

  instance_type                = "t2.medium"
  security_groups              = var.security_groups
  associate_public_ip_address  = false
  recreate_asg_when_lc_changes = true

  iam_instance_profile = var.iam_instance_profile
  user_data = templatefile("${path.module}/files/cloud-init.tmpl", {
    image       = var.sp_docker_image
    DB_HOST     = "${var.database_host}:${var.database_port}"
    DB_USER     = var.database_username
    DB_PASSWORD = var.database_password
  })

  # Auto scaling group
  asg_name            = local.asg_name
  vpc_zone_identifier = var.public_subnets
  health_check_type   = "EC2"
  min_size            = 1
  max_size            = 1
  desired_capacity    = 1
  target_group_arns   = var.target_group_arns

  tags = [
    {
      key                 = "Environment"
      value               = var.environment
      propagate_at_launch = true
    },
    {
      key                 = "Owner"
      value               = "terraform"
      propagate_at_launch = true
    }
  ]
}
