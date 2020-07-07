# https://registry.terraform.io/modules/terraform-aws-modules/alb

module "alb" {
  source = "terraform-aws-modules/alb/aws"

  name                             = "alb"
  enable_cross_zone_load_balancing = true
  load_balancer_type               = "application"
  vpc_id                           = module.vpc.vpc_id
  subnets                          = tolist(module.vpc.public_subnets)
  security_groups                  = [module.lb_sg.this_security_group_id]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
      action_type        = "forward"
    }
  ]

  target_groups = [
    {
      name             = "alb-tg"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
    }
  ]

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}

output "alb_target_group_arn" {
  value = tolist(module.alb.target_group_arns)[0]
}

resource "aws_autoscaling_attachment" "asg1-listener-tg" {
  autoscaling_group_name = module.asg1.this_autoscaling_group_id
  alb_target_group_arn   = tolist(module.alb.target_group_arns)[0]
}

resource "aws_autoscaling_attachment" "asg2-listener-tg" {
  autoscaling_group_name = module.asg2.this_autoscaling_group_id
  alb_target_group_arn   = tolist(module.alb.target_group_arns)[0]
}
