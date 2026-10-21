##-----------------------------------------------------------------------------
## General Variables
##-----------------------------------------------------------------------------

variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "AWS region where resources will be created."
}

variable "name" {
  type        = string
  default     = "my-ec2"
  description = "Name of the resources."
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment name (e.g. prod, dev, staging)."
}

variable "managed_by" {
  type        = string
  default     = "Terraform"
  description = "Identifier for who manages these resources."
}

##-----------------------------------------------------------------------------
## VPC Variables
##-----------------------------------------------------------------------------

variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block for the VPC."
}

variable "availability_zones" {
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
  description = "List of availability zones for subnets."
}

##-----------------------------------------------------------------------------
## EC2 Variables
##-----------------------------------------------------------------------------

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "EC2 instance type."
}

variable "instance_count" {
  type        = number
  default     = 1
  description = "Number of EC2 instances to launch."
}

variable "ami" {
  type        = string
  default     = ""
  description = "AMI ID. Leave empty to use latest Ubuntu 20.04."
}

variable "assign_eip_address" {
  type        = bool
  default     = false
  description = "Assign an Elastic IP to the instance."
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

variable "monitoring" {
  type        = bool
  default     = false
  description = "Enable detailed monitoring."
}

variable "ssh_allowed_ip" {
  type        = list(any)
  default     = ["0.0.0.0/0"]
  description = "List of IPs allowed for SSH access."
}

variable "tags" {
  type = map(string)
  default = {
    "Project" = "my-ec2"
    "Team"    = "devops"
  }
  description = "Additional tags for all resources."
}
