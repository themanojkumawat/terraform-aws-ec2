# terraform-aws-ec2

Terraform module to provision an EC2 instance on AWS with associated Elastic IP, EBS volume, KMS encryption, Security Group, and Key Pair.

> Maintained by [themanojkumawat](https://github.com/themanojkumawat)

## Features

- Creates EC2 instances (on-demand or spot)
- Auto-generates or uses existing SSH key pairs
- Creates and configures Security Groups with custom ingress/egress rules
- Optional Elastic IP assignment
- Optional additional EBS volume with KMS encryption
- Optional IAM Instance Profile attachment
- IMDSv2 support
- Spot instance support
- Fully taggable resources

## Usage

```hcl
module "ec2" {
  source = "github.com/themanojkumawat/terraform-aws-ec2"

  name           = "my-app"
  environment    = "prod"
  instance_type  = "t3.micro"
  instance_count = 1

  vpc_id     = "vpc-xxxxxxxx"
  subnet_ids = ["subnet-xxxxxxxx"]

  enable_key_pair = true

  enable_security_group = true
  ssh_allowed_ip        = ["10.0.0.0/8"]
  ssh_allowed_ports     = [22]

  allow_ingress_port_ip = {
    "80"  = "0.0.0.0/0"
    "443" = "0.0.0.0/0"
  }

  kms_key_enabled    = true
  ebs_volume_enabled = true
  ebs_volume_size    = 20
  ebs_volume_type    = "gp2"

  tags = {
    "Project" = "my-app"
    "Team"    = "devops"
  }
}
```

## Examples

See the [example](./example) directory for a complete working example.

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5.0 |
| aws       | >= 5.0.0 |
| tls       | >= 4.0.0 |

## Inputs

| Name                          | Type         | Default         | Required | Description                                      |
|-------------------------------|--------------|-----------------|----------|--------------------------------------------------|
| name                          | string       | `""`            | yes      | Name of the EC2 instance                         |
| environment                   | string       | `""`            | no       | Environment name                                 |
| managed_by                    | string       | `Terraform`     | no       | Identifier for resource manager                  |
| tags                          | map(any)     | `{}`            | no       | Additional tags                                  |
| enable                        | bool         | `true`          | no       | Flag to control module creation                  |
| ami                           | string       | `""`            | no       | AMI ID (defaults to Ubuntu 20.04)                |
| instance_type                 | string       | -               | yes      | EC2 instance type                                |
| instance_count                | number       | `1`             | no       | Number of instances to launch                    |
| vpc_id                        | string       | `""`            | yes      | VPC ID for the security group                    |
| subnet_ids                    | list(string) | `[]`            | yes      | List of subnet IDs                               |
| enable_key_pair               | bool         | `true`          | no       | Enable key pair creation                         |
| public_key                    | string       | `""`            | no       | Public key material (auto-generated if empty)    |
| enable_security_group         | bool         | `true`          | no       | Enable security group creation                   |
| ssh_allowed_ip                | list(any)    | `[]`            | no       | Allowed IPs for SSH                              |
| ssh_allowed_ports             | list(any)    | `[]`            | no       | Allowed ports for SSH                            |
| allow_ingress_port_ip         | map(string)  | `{}`            | no       | Map of port to CIDR for ingress                  |
| assign_eip_address            | bool         | `false`         | no       | Assign Elastic IP                                |
| ebs_volume_enabled            | bool         | `false`         | no       | Create additional EBS volume                     |
| ebs_volume_size               | number       | `30`            | no       | EBS volume size in GB                            |
| ebs_volume_type               | string       | `gp2`           | no       | EBS volume type                                  |
| kms_key_enabled               | bool         | `true`          | no       | Create KMS key for EBS encryption                |
| monitoring                    | bool         | `false`         | no       | Enable detailed monitoring                       |
| spot_instance_enabled         | bool         | `false`         | no       | Enable spot instance                             |
| spot_instance_count           | number       | `0`             | no       | Number of spot instances                         |
| metadata_http_tokens_required | string       | `optional`      | no       | IMDSv2 token requirement                         |

## Outputs

| Name               | Description                          |
|--------------------|--------------------------------------|
| instance_id        | EC2 instance IDs                     |
| instance_arn       | EC2 instance ARNs                    |
| public_ip          | Public IPs of instances              |
| private_ip         | Private IPs of instances             |
| public_dns         | Public DNS names                     |
| private_dns        | Private DNS names                    |
| key_pair_name      | Name of the key pair                 |
| private_key_pem    | Private key PEM (sensitive)          |
| security_group_id  | Security group ID                    |
| security_group_arn | Security group ARN                   |
| kms_key_id         | KMS key ID                           |
| kms_key_arn        | KMS key ARN                          |
| eip_public_ip      | Elastic IP public IPs                |
| ebs_volume_id      | EBS volume IDs                       |
| ebs_volume_arn     | EBS volume ARNs                      |
| instance_profile_id| IAM instance profile ID              |
| instance_profile_arn| IAM instance profile ARN            |

## License

MIT License. See [LICENSE](LICENSE) for details.

