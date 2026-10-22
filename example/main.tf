##-----------------------------------------------------------------------------
## Provider Configuration
##-----------------------------------------------------------------------------

provider "aws" {
  region = var.region
}

##-----------------------------------------------------------------------------
## VPC Module
##-----------------------------------------------------------------------------

module "vpc" {
  source = "github.com/themanojkumawat/terraform-aws-vpc"

  name        = var.name
  environment = var.environment
  managedby   = var.managed_by

  cidr_block            = var.vpc_cidr_block
  dns_hostnames_enabled = true
  dns_support_enabled   = true
}

##-----------------------------------------------------------------------------
## Subnet Module
##----------------------------------------------------------------------------

module "subnet" {
  source = "github.com/themanojkumawat/terraform-aws-subnet"

  name        = var.name
  environment = var.environment
  managedby   = var.managed_by

  vpc_id             = module.vpc.id
  igw_id             = module.vpc.igw_id
  cidr_block         = var.vpc_cidr_block
  availability_zones = var.availability_zones
  type               = "public"

  depends_on = [module.vpc]
}

##-----------------------------------------------------------------------------
## IAM Role Module (EC2 Instance Profile)
##-----------------------------------------------------------------------------

data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

module "iam_role" {
  source = "github.com/themanojkumawat/terraform-aws-iam-role"

  name        = var.name
  environment = var.environment
  managed_by  = var.managed_by

  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json

  policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]

  description = "IAM role for ${var.name} EC2 instances"

  depends_on = [module.vpc]
}

##-----------------------------------------------------------------------------
## EC2 Module
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

  # Networking - use VPC and Subnet from above modules
  vpc_id     = module.vpc.id
  subnet_ids = module.subnet.public_subnet_id

  # IAM Instance Profile
  instance_profile_enabled = true
  iam_instance_profile     = module.iam_role.name

  # Key pair - auto-generate
  enable_key_pair = true

  # Security group
  enable_security_group = true
  ssh_allowed_ip        = var.ssh_allowed_ip
  ssh_allowed_ports     = [22]

  allow_ingress_port_ip = {
    "80"  = "0.0.0.0/0"
    "443" = "0.0.0.0/0"
  }

  # EIP
  assign_eip_address = var.assign_eip_address

  # EBS volume
  ebs_volume_enabled = var.ebs_volume_enabled
  ebs_volume_size    = var.ebs_volume_size
  ebs_volume_type    = var.ebs_volume_type

  # KMS encryption
  kms_key_enabled = true

  # Monitoring
  monitoring = var.monitoring

  # IMDSv2
  metadata_http_tokens_required = "optional"

  tags = var.tags

  depends_on = [module.subnet, module.iam_role]
}
