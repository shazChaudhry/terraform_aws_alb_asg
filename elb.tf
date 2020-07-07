# https://registry.terraform.io/modules/terraform-aws-modules/elb

module "elb" {
  source = "terraform-aws-modules/elb/aws"

  name = "elb"

  subnets         = tolist(module.vpc.public_subnets)
  security_groups = [module.lb_sg.this_security_group_id]
  internal        = false

  listener = [
    {
      instance_port     = "80"
      instance_protocol = "HTTP"
      lb_port           = "80"
      lb_protocol       = "HTTP"
    },
  ]

  health_check = {
    target              = "HTTP:80/"
    interval            = 10
    healthy_threshold   = 4
    unhealthy_threshold = 2
    timeout             = 5
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
