resource "aws_lb" "sp_alb" {
  name               = "sp-lb-${var.environment}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sp_alb_sg.id]
  subnets            = module.sp_vpc.public_subnets

  enable_deletion_protection = true

  tags = {
    Owner       = "terraform"
    Environment = var.environment
  }
}

resource "aws_lb_target_group" "sp_lb_tg" {
  name     = "sp-lb-tg-${var.environment}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.sp_vpc.vpc_id
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.sp_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.sp_lb_tg.arn
  }
}

resource "aws_security_group" "sp_alb_sg" {
  name        = "sp-alb-sg-${var.environment}"
  description = "SP ALB security group"
  vpc_id      = module.sp_vpc.vpc_id

  ingress {
    description = "Allow traffic on port 80 from everywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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
