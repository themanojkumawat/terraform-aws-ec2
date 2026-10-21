##-----------------------------------------------------------------------------
## Provider Configuration
##-----------------------------------------------------------------------------

provider "aws" {
  region = var.region
}

##-----------------------------------------------------------------------------
## Data Sources
##-----------------------------------------------------------------------------

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

##-----------------------------------------------------------------------------
## EC2 Module Example
##-----------------------------------------------------------------------------

module "ec2" {
  source = "../"

  name        = var.name
  environment = var.environment
  managed_by  = var.managed_by

  # Instance configuration
  instance_type  = var.instance_type
  instance_count = var.instance_count
  ami            = var.ami

  # Networking
  vpc_id     = data.aws_vpc.default.id
  subnet_ids = data.aws_subnets.default.ids

  # Key pair - auto-generate if not provided
  enable_key_pair = var.enable_key_pair
  public_key      = var.public_key

  # Security group
  enable_security_group = var.enable_security_group
  ssh_allowed_ip        = var.ssh_allowed_ip
  ssh_allowed_ports     = var.ssh_allowed_ports

  allow_ingress_port_ip = var.allow_ingress_port_ip

  # EIP
  assign_eip_address = var.assign_eip_address

  # EBS volume
  ebs_volume_enabled = var.ebs_volume_enabled
  ebs_volume_size    = var.ebs_volume_size
  ebs_volume_type    = var.ebs_volume_type

  # KMS encryption
  kms_key_enabled = var.kms_key_enabled

  # Monitoring
  monitoring = var.monitoring

  # IMDSv2
  metadata_http_tokens_required = var.metadata_http_tokens_required

  tags = var.tags
}
