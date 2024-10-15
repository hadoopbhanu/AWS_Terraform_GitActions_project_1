

# ALB
resource "aws_lb" "ALB" {
  name               = "Webapp-Load-Balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_id]
  subnets            = var.subnets

  enable_deletion_protection = true
}

# Listener

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.ALB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.TG.arn
  }
}


# Target Group

resource "aws_lb_target_group" "TG" {
  name     = "ALB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

# Target group attachment

resource "aws_lb_target_group_attachment" "TGA" {
    count =length(var.instances)
  target_group_arn = aws_lb_target_group.TG.arn
  target_id        = var.instances[count.index]
  port             = 80
}


