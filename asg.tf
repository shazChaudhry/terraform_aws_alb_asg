# https://registry.terraform.io/modules/terraform-aws-modules/autoscaling

module "asg1" {
  source = "terraform-aws-modules/autoscaling/aws"
  name   = "asg1"

  # Launch configuration
  lc_name                      = "asg1-lc"
  image_id                     = data.aws_ami.latest_amzn_ami.id
  instance_type                = var.instance_type
  security_groups              = [module.web_server_sg.this_security_group_id]
  load_balancers               = [module.elb.this_elb_id]
  recreate_asg_when_lc_changes = true
  user_data                    = data.template_cloudinit_config.asg1.rendered

  # Auto scaling group
  asg_name                  = "asg1"
  vpc_zone_identifier       = [module.vpc.private_subnets[0]]
  health_check_type         = "EC2"
  min_size                  = 1
  max_size                  = 5
  desired_capacity          = 1
  wait_for_capacity_timeout = 0

  tags = [
    {
      key                 = "Terraform"
      value               = "true"
      propagate_at_launch = true
    },
    {
      key                 = "Environment"
      value               = "dev"
      propagate_at_launch = true
    },
  ]
}

module "asg2" {
  source = "terraform-aws-modules/autoscaling/aws"
  name   = "asg2"

  # Launch configuration
  lc_name                      = "asg2-lc"
  image_id                     = data.aws_ami.latest_amzn_ami.id
  instance_type                = var.instance_type
  security_groups              = [module.web_server_sg.this_security_group_id]
  load_balancers               = [module.elb.this_elb_id]
  recreate_asg_when_lc_changes = true
  user_data                    = data.template_cloudinit_config.asg2.rendered

  # Auto scaling group
  asg_name                  = "asg2"
  vpc_zone_identifier       = [module.vpc.private_subnets[1]]
  health_check_type         = "EC2"
  min_size                  = 1
  max_size                  = 5
  desired_capacity          = 1
  wait_for_capacity_timeout = 0

  tags = [
    {
      key                 = "Terraform"
      value               = "true"
      propagate_at_launch = true
    },
    {
      key                 = "Environment"
      value               = "dev"
      propagate_at_launch = true
    },
  ]
}