data "aws_availability_zones" "all" {}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

# Get the latest EC2 AMI
data "aws_ami" "latest_amzn_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  owners = ["amazon"]
}