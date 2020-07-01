# https://registry.terraform.io/modules/terraform-aws-modules/security-group

module "alb_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = "alb"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp"]
  # there are two private subnets where ASGs will be deployed to
  egress_cidr_blocks  = tolist(module.vpc.private_subnets_cidr_blocks) 
}

module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = "web-server"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = module.vpc.vpc_id

  # there is only one public subnet where http traffic will come from
  ingress_cidr_blocks = tolist(module.vpc.public_subnets_cidr_blocks) 
  ingress_rules       = ["http-80-tcp"]
  egress_cidr_blocks = ["0.0.0.0/0"]
}