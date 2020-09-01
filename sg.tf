resource "aws_security_group" "sp_app_sg" {
  name        = "sp-app-sg-${var.environment}"
  description = "SP Web application security group"
  vpc_id      = module.sp_vpc.vpc_id

  ingress {
    description     = "Allow traffic from load balancer"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.sp_alb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = var.environment
    Owner       = "terraform"
  }
}

resource "aws_security_group" "sp_rds_sg" {
  name        = "sp-rds-sg-${var.environment}"
  description = "SP RDS security group"
  vpc_id      = module.sp_vpc.vpc_id

  ingress {
    description     = "Allow traffic from load balancer"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.sp_app_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = var.environment
    Owner       = "terraform"
  }
}
