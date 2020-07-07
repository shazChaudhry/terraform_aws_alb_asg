# # https://registry.terraform.io/modules/terraform-aws-modules/alb

# This code has been disabled as NLB target groups appear to 
# delete ALB target groups.

# For NLB to work alongside ALB, ASG security will need to be 
# open from the entire world e.g. 0.0.0.0/0

# module "nlb" {
#   source = "terraform-aws-modules/alb/aws"

#   name                             = "nlb"
#   enable_cross_zone_load_balancing = true
#   load_balancer_type               = "network"
#   vpc_id                           = module.vpc.vpc_id
#   subnets                          = tolist(module.vpc.public_subnets)

#   http_tcp_listeners = [
#     {
#       port               = 80
#       protocol           = "TCP"
#       target_group_index = 0
#     },
#   ]

#   target_groups = [
#     {
#       name_prefix      = "nlb-"
#       backend_protocol = "TCP"
#       backend_port     = 80
#       target_type      = "instance"
#     }
#   ]

#   tags = {
#     Environment = "dev"
#     Terraform   = "true"
#   }
# }

# resource "aws_autoscaling_attachment" "asg1-nlb-listener-tg" {
#   autoscaling_group_name = module.asg1.this_autoscaling_group_id
#   alb_target_group_arn   = tolist(module.nlb.target_group_arns)[0]
# }

# resource "aws_autoscaling_attachment" "asg2-nlb-listener-tg" {
#   autoscaling_group_name = module.asg2.this_autoscaling_group_id
#   alb_target_group_arn   = tolist(module.nlb.target_group_arns)[0]
# }
