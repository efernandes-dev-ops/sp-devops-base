module "sp_asg" {
  source = "./modules/asg"

  environment = var.environment

  asg_name             = "sp-asg"
  public_subnets       = module.sp_vpc.private_subnets
  launch_config_name   = "sp-lc"
  security_groups      = [aws_security_group.sp_app_sg.id]
  iam_instance_profile = aws_iam_instance_profile.sp_app_instance_profile.id
  sp_docker_image      = "wordpress"
  database_host        = module.sp_rds.rds_host
  database_username    = module.sp_rds.rds_username
  database_password    = module.sp_rds.rds_password
  target_group_arns    = [aws_lb_target_group.sp_lb_tg.arn]
}

