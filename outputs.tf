##-----------------------------------------------------------------------------
## EC2 Instance Outputs
##-----------------------------------------------------------------------------

output "instance_id" {
  value       = try(aws_instance.this[*].id, null)
  description = "The IDs of the EC2 instances."
}

output "instance_arn" {
  value       = try(aws_instance.this[*].arn, null)
  description = "The ARNs of the EC2 instances."
}

output "public_ip" {
  value       = try(aws_instance.this[*].public_ip, null)
  description = "The public IPs assigned to the EC2 instances."
}

output "private_ip" {
  value       = try(aws_instance.this[*].private_ip, null)
  description = "The private IPs assigned to the EC2 instances."
}

output "public_dns" {
  value       = try(aws_instance.this[*].public_dns, null)
  description = "The public DNS names of the EC2 instances."
}

output "private_dns" {
  value       = try(aws_instance.this[*].private_dns, null)
  description = "The private DNS names of the EC2 instances."
}

output "availability_zone" {
  value       = try(aws_instance.this[*].availability_zone, null)
  description = "The availability zones of the EC2 instances."
}

output "subnet_id" {
  value       = try(aws_instance.this[*].subnet_id, null)
  description = "The subnet IDs of the EC2 instances."
}

output "tags" {
  value       = try(aws_instance.this[*].tags_all, null)
  description = "Tags assigned to the EC2 instances."
}

##-----------------------------------------------------------------------------
## Key Pair Outputs
##-----------------------------------------------------------------------------

output "key_pair_name" {
  value       = try(aws_key_pair.this[0].key_name, null)
  description = "The name of the key pair."
}

output "private_key_pem" {
  value       = try(tls_private_key.this[0].private_key_pem, null)
  sensitive   = true
  description = "The private key in PEM format (only available when key pair is auto-generated)."
}

##-----------------------------------------------------------------------------
## Security Group Outputs
##-----------------------------------------------------------------------------

output "security_group_id" {
  value       = try(aws_security_group.this[0].id, null)
  description = "The ID of the security group."
}

output "security_group_arn" {
  value       = try(aws_security_group.this[0].arn, null)
  description = "The ARN of the security group."
}

##-----------------------------------------------------------------------------
## KMS Key Outputs
##-----------------------------------------------------------------------------

output "kms_key_id" {
  value       = try(aws_kms_key.this[0].id, null)
  description = "The ID of the KMS key."
}

output "kms_key_arn" {
  value       = try(aws_kms_key.this[0].arn, null)
  description = "The ARN of the KMS key."
}

##-----------------------------------------------------------------------------
## EIP Outputs
##-----------------------------------------------------------------------------

output "eip_public_ip" {
  value       = try(aws_eip.this[*].public_ip, null)
  description = "The public IPs of the Elastic IPs."
}

##-----------------------------------------------------------------------------
## EBS Volume Outputs
##-----------------------------------------------------------------------------

output "ebs_volume_id" {
  value       = try(aws_ebs_volume.this[*].id, null)
  description = "The IDs of the EBS volumes."
}

output "ebs_volume_arn" {
  value       = try(aws_ebs_volume.this[*].arn, null)
  description = "The ARNs of the EBS volumes."
}

##-----------------------------------------------------------------------------
## IAM Instance Profile Outputs
##-----------------------------------------------------------------------------

output "instance_profile_id" {
  value       = try(aws_iam_instance_profile.this[0].id, null)
  description = "The ID of the IAM instance profile."
}

output "instance_profile_arn" {
  value       = try(aws_iam_instance_profile.this[0].arn, null)
  description = "The ARN of the IAM instance profile."
}
