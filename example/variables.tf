##-----------------------------------------------------------------------------
## Example Variables
##-----------------------------------------------------------------------------

variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "AWS region where resources will be created."
}

variable "name" {
  type        = string
  default     = "my-ec2"
  description = "Name of the EC2 instance."
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment name."
}

variable "managed_by" {
  type        = string
  default     = "Terraform"
  description = "Identifier for who manages this resource."
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "EC2 instance type."
}

variable "instance_count" {
  type        = number
  default     = 1
  description = "Number of instances to launch."
}

variable "ami" {
  type        = string
  default     = ""
  description = "AMI ID. Leave empty to use latest Ubuntu 20.04."
}

variable "enable_key_pair" {
  type        = bool
  default     = true
  description = "Whether to create a key pair."
}

variable "public_key" {
  type        = string
  default     = ""
  sensitive   = true
  description = "Public key material. Leave empty to auto-generate."
}

variable "enable_security_group" {
  type        = bool
  default     = true
  description = "Whether to create a security group."
}

variable "ssh_allowed_ip" {
  type        = list(any)
  default     = ["0.0.0.0/0"]
  description = "List of IPs allowed for SSH access."
}

variable "ssh_allowed_ports" {
  type        = list(any)
  default     = [22]
  description = "List of ports allowed for SSH."
}

variable "allow_ingress_port_ip" {
  type        = map(string)
  default = {
    "80"  = "0.0.0.0/0"
    "443" = "0.0.0.0/0"
  }
  description = "Map of port to CIDR for ingress rules."
}

variable "assign_eip_address" {
  type        = bool
  default     = false
  description = "Assign Elastic IP to the instance."
}

variable "ebs_volume_enabled" {
  type        = bool
  default     = false
  description = "Whether to create an additional EBS volume."
}

variable "ebs_volume_size" {
  type        = number
  default     = 20
  description = "EBS volume size in GB."
}

variable "ebs_volume_type" {
  type        = string
  default     = "gp2"
  description = "EBS volume type."
}

variable "kms_key_enabled" {
  type        = bool
  default     = true
  description = "Whether to create a KMS key for EBS encryption."
}

variable "monitoring" {
  type        = bool
  default     = false
  description = "Enable detailed monitoring."
}

variable "metadata_http_tokens_required" {
  type        = string
  default     = "optional"
  description = "IMDSv2 token requirement (optional or required)."
}

variable "tags" {
  type = map(string)
  default = {
    "Project" = "my-ec2"
    "Team"    = "devops"
  }
  description = "Additional tags."
}
