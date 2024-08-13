output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = module.my_security_group.id
}

output "security_group_arn" {
  description = "The ARN of the security group"
  value       = module.my_security_group.arn
}
