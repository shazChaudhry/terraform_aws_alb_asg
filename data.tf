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

# Render a part using a `template_file: 
# https://www.terraform.io/docs/providers/template/d/cloudinit_config.html
data "template_file" "cloud-config-packages" {
  template = "${file("${path.module}/templates/cloud-config-packages.tpl")}"
}

# Render a part using a `template_file: 
data "template_file" "cloud-config-runcmd1" {
  template = "${file("${path.module}/templates/cloud-config-runcmd.tpl")}"
  vars = {
    asg = "asg1"
  }
}

# Render a multi-part cloud-init config making use of the part above, and other source files
data "template_cloudinit_config" "asg1" {
  part {
    content = "${data.template_file.cloud-config-packages.rendered}"
  }
  part {
    content = "${data.template_file.cloud-config-runcmd1.rendered}"
  }
}

# Render a part using a `template_file: 
data "template_file" "cloud-config-runcmd2" {
  template = "${file("${path.module}/templates/cloud-config-runcmd.tpl")}"
  vars = {
    asg = "asg2"
  }
}

# Render a multi-part cloud-init config making use of the part above, and other source files
data "template_cloudinit_config" "asg2" {
  part {
    content = "${data.template_file.cloud-config-packages.rendered}"
  }
  part {
    content = "${data.template_file.cloud-config-runcmd2.rendered}"
  }
}
