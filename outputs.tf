output "vpc_id" {
  value       = module.vpc.vpc_id
}

output "elb_dns_name" {
  value = module.elb.this_elb_dns_name
}

output "alb_dns_name" {
  value = module.alb.this_lb_dns_name
}

# output "nlb_dns_name" {
#   value = module.nlb.this_lb_dns_name
# }