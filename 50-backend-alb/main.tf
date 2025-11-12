resource "aws_lb" "backend_alb" {
  name               = "${local.common_name_suffix}-backend-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [local.backend_alb_sg_id]
  subnets            = local.private_subnet_ids

  enable_deletion_protection = false  # prevents accidental deletion through UI 

  
  tags = merge(
        local.common_tags,
    {
        Name = "${local.common_name_suffix}-backend-alb"
    }
   )
}

# backend alb listening on port 80
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.backend_alb.arn  # from above backennd alb to listen
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Hi, I am from backend ALB HTTP"
      status_code  = "200"
    }
  }
}