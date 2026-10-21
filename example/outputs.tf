##-----------------------------------------------------------------------------
## VPC Outputs
##-----------------------------------------------------------------------------

output "vpc_id" {
  value       = module.vpc.id
  description = "The ID of the VPC."
}

output "vpc_cidr" {
  value       = module.vpc.vpc_cidr_block
  description = "The CIDR block of the VPC."
}

##-----------------------------------------------------------------------------
## Subnet Outputs
##-----------------------------------------------------------------------------

output "public_subnet_ids" {
  value       = module.subnet.public_subnet_id
  description = "IDs of the public subnets."
}

##-----------------------------------------------------------------------------
## IAM Role Outputs
##-----------------------------------------------------------------------------

output "iam_role_arn" {
  value       = module.iam_role.arn
  description = "ARN of the IAM role."
}

output "iam_role_name" {
  value       = module.iam_role.name
  description = "Name of the IAM role."
}

##-----------------------------------------------------------------------------
## EC2 Outputs
##-----------------------------------------------------------------------------

output "instance_id" {
  value       = module.ec2.instance_id
  description = "The IDs of the EC2 instances."
}

output "public_ip" {
  value       = module.ec2.public_ip
  description = "The public IPs of the EC2 instances."
}

output "private_ip" {
  value       = module.ec2.private_ip
  description = "The private IPs of the EC2 instances."
}

output "public_dns" {
  value       = module.ec2.public_dns
  description = "The public DNS names of the EC2 instances."
}

output "key_pair_name" {
  value       = module.ec2.key_pair_name
  description = "The name of the key pair."
}

output "security_group_id" {
  value       = module.ec2.security_group_id
  description = "The ID of the security group."
}

output "kms_key_arn" {
  value       = module.ec2.kms_key_arn
  description = "The ARN of the KMS key."
}
