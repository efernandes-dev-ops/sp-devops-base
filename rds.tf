resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

module "sp_rds" {
  source = "./modules/rds"

  environment         = var.environment
  rds_identifier_name = "sp-rds-${var.environment}"
  db_name             = "sprds${var.environment}"

  db_user     = var.db_user
  db_password = var.db_password == "" ? random_password.password.result : var.db_password

  vpc_subnet_ids        = module.sp_vpc.private_subnets
  vpc_security_group_id = aws_security_group.sp_rds_sg.id
}