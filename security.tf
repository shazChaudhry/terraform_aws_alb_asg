# https://registry.terraform.io/modules/terraform-aws-modules/security-group

module "lb_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name                = "lb"
  description         = "Security group for ALB with HTTP ports open within VPC"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_cidr_blocks  = module.vpc.private_subnets_cidr_blocks
}

module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name                = "web-server"
  description         = "Security group for web-server with HTTP ports open within VPC"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = module.vpc.public_subnets_cidr_blocks
}
