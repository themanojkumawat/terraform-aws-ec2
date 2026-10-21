##-----------------------------------------------------------------------------
## Example Outputs
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
