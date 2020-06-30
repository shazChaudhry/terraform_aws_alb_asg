variable "region" {
  type        = string
  description = "This is the region where network resources will be launched"
}

variable "instance_type" {
  type        = string
  description = "Define EC2 instance type"
}

variable "vpc_cidr_block" {
  type        = string
  description = "Define VPC cidr block"
}

variable "DnsZoneName" {
  type        = string
  description = "DnsZoneName"
}