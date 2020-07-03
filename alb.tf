# https://registry.terraform.io/modules/terraform-aws-modules/alb

# module "lb" {
#   source = "terraform-aws-modules/alb/aws"

#   name                             = "alb"
#   enable_cross_zone_load_balancing = true
#   load_balancer_type               = "application"
#   vpc_id                           = module.vpc.vpc_id
#   subnets                          = tolist(module.vpc.public_subnets)
#   security_groups                  = [module.alb_sg.this_security_group_id]

#   http_tcp_listeners = [
#     {
#       port               = 80
#       protocol           = "HTTP"
#       target_group_index = 0
#       action_type        = "forward"
#     }
#   ]

#   target_groups = [
#     {
#       name             = "alb-tg"
#       backend_protocol = "HTTP"
#       backend_port     = 80
#       target_type      = "instance"
#     }
#   ]

#   tags = {
#     Environment = "dev"
#     Terraform   = "true"
#   }
# }