##-----------------------------------------------------------------------------
## General Variables
##-----------------------------------------------------------------------------

variable "name" {
  type        = string
  default     = ""
  description = "Name of the resource (e.g. `app` or `cluster`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment name (e.g. `prod`, `dev`, `staging`)."
}

variable "managed_by" {
  type        = string
  default     = "Terraform"
  description = "Identifier for who manages this resource (used in tags)."
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between name and environment."
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`, `XYZ`))."
}

variable "enable" {
  type        = bool
  default     = true
  description = "Flag to control module creation."
}

##-----------------------------------------------------------------------------
## EC2 Instance Variables
##-----------------------------------------------------------------------------

variable "ami" {
  type        = string
  default     = ""
  description = "The AMI to use for the instance. Defaults to latest Ubuntu 20.04."
}

variable "instance_type" {
  type        = string
  description = "The type of instance to start (e.g. t3.micro)."
}

variable "instance_count" {
  type        = number
  default     = 1
  description = "Number of instances to launch."
}

variable "ebs_optimized" {
  type        = bool
  default     = false
  description = "If true, the launched EC2 instance will be EBS-optimized."
}

variable "monitoring" {
  type        = bool
  default     = false
  description = "If true, the launched EC2 instance will have detailed monitoring enabled."
}

variable "associate_public_ip_address" {
  type        = bool
  default     = true
  sensitive   = true
  description = "Associate a public IP address with the instance."
}

variable "disable_api_termination" {
  type        = bool
  default     = false
  description = "If true, enables EC2 Instance Termination Protection."
}

variable "disable_api_stop" {
  type        = bool
  default     = false
  description = "Whether to enable stopping the instance via the API."
}

variable "instance_initiated_shutdown_behavior" {
  type        = string
  default     = "terminate"
  description = "Shutdown behavior for the instance (stop or terminate)."
}

variable "placement_group" {
  type        = string
  default     = ""
  description = "The Placement Group to start the instance in."
}

variable "placement_partition_number" {
  type        = number
  default     = null
  description = "Partition number in the placement group."
}

variable "tenancy" {
  type        = string
  default     = "default"
  description = "The tenancy of the instance (default, dedicated, or host)."
}

variable "host_id" {
  type        = string
  default     = null
  description = "The ID of a dedicated host that the instance will be assigned to."
}

variable "availability_zone" {
  type        = string
  default     = null
  description = "AZ to start the instance in."
}

variable "subnet_ids" {
  type        = list(string)
  default     = []
  sensitive   = true
  description = "A list of VPC Subnet IDs to launch in."
}

variable "source_dest_check" {
  type        = bool
  default     = true
  description = "Controls if traffic is routed to the instance when destination address does not match the instance."
}

variable "user_data_base64" {
  type        = string
  default     = null
  description = "Base64 encoded user data for the EC2 instance."
}

variable "user_data_replace_on_change" {
  type        = bool
  default     = null
  description = "When true, triggers a destroy and recreate when user_data changes."
}

variable "get_password_data" {
  type        = bool
  default     = null
  description = "If true, wait for password data to become available and retrieve it."
}

variable "private_ip" {
  type        = string
  default     = null
  description = "Private IP address to associate with the instance in a VPC."
}

variable "secondary_private_ips" {
  type        = list(string)
  default     = null
  description = "A list of secondary private IPv4 addresses to assign to the instance."
}

variable "ipv6_address_count" {
  type        = number
  default     = null
  description = "Number of IPv6 addresses to associate with the primary network interface."
}

variable "ipv6_addresses" {
  type        = list(any)
  default     = null
  sensitive   = true
  description = "List of IPv6 addresses from the range of the subnet to associate with the primary network interface."
}

variable "hibernation" {
  type        = bool
  default     = false
  description = "If true, the instance will support hibernation."
}

variable "default_instance_enabled" {
  type        = bool
  default     = true
  description = "Flag to control the instance creation."
}

variable "instance_tags" {
  type        = map(any)
  default     = {}
  description = "Additional tags for EC2 instances."
}

variable "iam_instance_profile" {
  type        = string
  default     = ""
  description = "The IAM Instance Profile name to launch the instance with."
}

variable "instance_profile_enabled" {
  type        = bool
  default     = false
  description = "Flag to control the instance profile creation."
}

variable "cpu_credits" {
  type        = string
  default     = "standard"
  description = "The credit option for CPU usage. Can be standard or unlimited."
}

variable "cpu_options" {
  type        = any
  default     = {}
  description = "Defines CPU options to apply to the instance at launch time."
}

variable "capacity_reservation_specification" {
  type        = any
  default     = {}
  description = "Describes an instance's Capacity Reservation targeting option."
}

variable "network_interface" {
  type        = list(map(string))
  default     = []
  description = "Customize network interfaces to be attached at instance boot time."
}

variable "launch_template" {
  type        = map(string)
  default     = {}
  description = "Specifies a Launch Template to configure the instance."
}

variable "enclave_options_enabled" {
  type        = bool
  default     = false
  description = "Whether Nitro Enclaves will be enabled on the instance."
}

variable "timeouts" {
  type        = map(string)
  default     = {}
  description = "Define maximum timeout for creating and deleting EC2 instance resources."
}

variable "maintenance_options" {
  type = object({
    auto_recovery = string
  })
  default = {
    auto_recovery = null
  }
  description = "Options for instance maintenance."
}

variable "root_block_device" {
  type        = list(any)
  default     = []
  description = "Customize details about the root block device of the instance."
}

variable "ebs_block_device" {
  type        = list(any)
  default     = []
  description = "Additional EBS block devices to attach to the instance."
}

variable "ephemeral_block_device" {
  type        = list(any)
  default     = []
  description = "Customize Ephemeral (Instance Store) volumes on the instance."
}

##-----------------------------------------------------------------------------
## EIP Variables
##-----------------------------------------------------------------------------

variable "assign_eip_address" {
  type        = bool
  default     = false
  sensitive   = true
  description = "Assign an Elastic IP address to the instance."
}

##-----------------------------------------------------------------------------
## EBS Volume Variables
##-----------------------------------------------------------------------------

variable "ebs_volume_enabled" {
  type        = bool
  default     = false
  description = "Flag to control additional EBS volume creation."
}

variable "ebs_volume_size" {
  type        = number
  default     = 30
  description = "Size of the EBS volume in gigabytes."
}

variable "ebs_volume_type" {
  type        = string
  default     = "gp2"
  description = "The type of EBS volume (standard, gp2, gp3, io1, io2)."
}

variable "ebs_iops" {
  type        = number
  default     = 3000
  description = "Amount of provisioned IOPS. Required for io1/io2/gp3 volumes."
}

variable "ebs_device_name" {
  type = list(string)
  default = [
    "/dev/xvdb", "/dev/xvdc", "/dev/xvdd", "/dev/xvde", "/dev/xvdf",
    "/dev/xvdg", "/dev/xvdh", "/dev/xvdi", "/dev/xvdj", "/dev/xvdk",
    "/dev/xvdl", "/dev/xvdm", "/dev/xvdn", "/dev/xvdo", "/dev/xvdp",
    "/dev/xvdq", "/dev/xvdr", "/dev/xvds", "/dev/xvdt", "/dev/xvdu",
    "/dev/xvdv", "/dev/xvdw", "/dev/xvdx", "/dev/xvdy", "/dev/xvdz"
  ]
  description = "EBS device names to mount."
}

variable "multi_attach_enabled" {
  type        = bool
  default     = false
  description = "Specifies whether to enable Amazon EBS Multi-Attach."
}

variable "final_snapshot" {
  type        = bool
  default     = false
  description = "If true, a snapshot will be created before volume deletion."
}

variable "snapshot_id" {
  type        = string
  default     = ""
  description = "Optional snapshot ID to base the EBS volume on."
}

variable "outpost_arn" {
  type        = string
  default     = ""
  description = "Optional ARN of the Outpost."
}

variable "force_detach" {
  type        = bool
  default     = false
  description = "Force detach the volume."
}

variable "skip_destroy" {
  type        = bool
  default     = false
  description = "Skip destroy and only remove the attachment from Terraform state."
}

variable "stop_instance_before_detaching" {
  type        = bool
  default     = false
  description = "Stop instance before detaching the volume."
}

##-----------------------------------------------------------------------------
## KMS Variables
##-----------------------------------------------------------------------------

variable "kms_key_enabled" {
  type        = bool
  default     = true
  description = "Specifies whether the KMS key is enabled or disabled."
}

variable "kms_key_id" {
  type        = string
  default     = ""
  description = "The ARN of an existing KMS key for encryption. Leave empty to create a new one."
}

variable "alias" {
  type        = string
  default     = ""
  description = "The display name of the KMS alias. Must start with alias/."
}

variable "kms_description" {
  type        = string
  default     = "KMS key for EC2 EBS encryption"
  description = "The description of the KMS key."
}

variable "key_usage" {
  type        = string
  default     = "ENCRYPT_DECRYPT"
  sensitive   = true
  description = "Specifies the intended use of the key."
}

variable "deletion_window_in_days" {
  type        = number
  default     = 7
  description = "Duration in days after which the key is deleted after destruction of the resource."
}

variable "is_enabled" {
  type        = bool
  default     = true
  description = "Specifies whether the KMS key is enabled."
}

variable "enable_key_rotation" {
  type        = bool
  default     = true
  description = "Specifies whether key rotation is enabled."
}

variable "customer_master_key_spec" {
  type        = string
  default     = "SYMMETRIC_DEFAULT"
  sensitive   = true
  description = "Specifies the key spec for the KMS key."
}

variable "kms_multi_region" {
  type        = bool
  default     = false
  description = "Indicates whether the KMS key is a multi-Region key."
}

##-----------------------------------------------------------------------------
## Security Group Variables
##-----------------------------------------------------------------------------

variable "vpc_id" {
  type        = string
  default     = ""
  sensitive   = true
  description = "The ID of the VPC that the instance security group belongs to."
}

variable "enable_security_group" {
  type        = bool
  default     = true
  description = "Enable default Security Group with only Egress traffic allowed."
}

variable "revoke_rules_on_delete" {
  type        = bool
  default     = false
  description = "Revoke security group rules before deleting them."
}

variable "sg_ids" {
  type        = list(any)
  default     = []
  description = "List of existing security group IDs to attach."
}

variable "sg_description" {
  type        = string
  default     = "EC2 instance default security group (only egress access is allowed)."
  description = "The security group description."
}

variable "sg_egress_description" {
  type        = string
  default     = "Allow all outbound IPv4 traffic."
  description = "Description of the egress rule."
}

variable "sg_egress_ipv6_description" {
  type        = string
  default     = "Allow all outbound IPv6 traffic."
  description = "Description of the egress IPv6 rule."
}

variable "sg_ingress_description" {
  type        = string
  default     = "Allow inbound traffic."
  description = "Description of the ingress rule."
}

variable "egress_rule" {
  type        = bool
  default     = true
  description = "Enable to create egress rule."
}

variable "is_external" {
  type        = bool
  default     = false
  description = "Enable to update existing security group."
}

variable "protocol" {
  type        = string
  default     = "tcp"
  description = "The protocol for ingress rules."
}

variable "allow_ingress_port_ip" {
  type        = map(string)
  default     = {}
  description = "Map of port numbers to CIDR blocks for ingress rules."
}

variable "egress_ipv4_from_port" {
  type        = number
  default     = 0
  description = "Egress start port."
}

variable "egress_ipv4_to_port" {
  type        = number
  default     = 65535
  description = "Egress end port."
}

variable "egress_ipv4_protocol" {
  type        = string
  default     = "-1"
  description = "Egress protocol."
}

variable "egress_ipv4_cidr_block" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "Egress IPv4 CIDR blocks."
}

variable "egress_ipv6_from_port" {
  type        = number
  default     = 0
  description = "Egress IPv6 start port."
}

variable "egress_ipv6_to_port" {
  type        = number
  default     = 65535
  description = "Egress IPv6 end port."
}

variable "egress_ipv6_protocol" {
  type        = string
  default     = "-1"
  description = "Egress IPv6 protocol."
}

variable "egress_ipv6_cidr_block" {
  type        = list(string)
  default     = ["::/0"]
  description = "Egress IPv6 CIDR blocks."
}

variable "ssh_allowed_ip" {
  type        = list(any)
  default     = []
  description = "List of allowed IPs for SSH access."
}

variable "ssh_allowed_ports" {
  type        = list(any)
  default     = []
  description = "List of allowed ingress ports for SSH."
}

variable "ssh_protocol" {
  type        = string
  default     = "tcp"
  description = "Protocol for SSH rules."
}

variable "ssh_sg_ingress_description" {
  type        = string
  default     = "Allow SSH inbound traffic."
  description = "Description of the SSH ingress rule."
}

##-----------------------------------------------------------------------------
## Key Pair Variables
##-----------------------------------------------------------------------------

variable "enable_key_pair" {
  type        = bool
  default     = true
  description = "Flag to enable/disable key pair creation."
}

variable "public_key" {
  type        = string
  default     = ""
  sensitive   = true
  description = "Public key material for the key pair. If empty, a new key will be generated."
}

variable "key_name" {
  type        = string
  default     = ""
  description = "Key name of the Key Pair to use for the instance."
}

variable "algorithm" {
  type        = string
  default     = "RSA"
  description = "Algorithm for key generation (RSA, ECDSA, ED25519)."
}

variable "rsa_bits" {
  type        = number
  default     = 4096
  description = "RSA key size in bits."
}

##-----------------------------------------------------------------------------
## Metadata Options
##-----------------------------------------------------------------------------

variable "metadata_http_tokens_required" {
  type        = string
  default     = "optional"
  description = "Whether IMDSv2 is required. Valid values: optional or required."
}

variable "metadata_http_endpoint_enabled" {
  type        = string
  default     = "enabled"
  description = "Whether the metadata service is available. Valid values: enabled or disabled."
}

variable "metadata_http_put_response_hop_limit" {
  type        = number
  default     = 2
  description = "HTTP PUT response hop limit for instance metadata requests (1-64)."
}

variable "instance_metadata_tags_enabled" {
  type        = string
  default     = "disabled"
  description = "Whether metadata tags are available. Valid values: enabled or disabled."
}

##-----------------------------------------------------------------------------
## Spot Instance Variables
##-----------------------------------------------------------------------------

variable "spot_instance_enabled" {
  type        = bool
  default     = false
  description = "Flag to control spot instance creation."
}

variable "spot_instance_count" {
  type        = number
  default     = 0
  description = "Number of spot instances to launch."
}

variable "spot_price" {
  type        = string
  default     = null
  description = "The maximum price to request on the spot market."
}

variable "spot_wait_for_fulfillment" {
  type        = bool
  default     = false
  description = "If set, Terraform will wait for the Spot Request to be fulfilled."
}

variable "spot_type" {
  type        = string
  default     = null
  description = "Spot instance type (one-time or persistent)."
}

variable "spot_launch_group" {
  type        = string
  default     = null
  description = "A launch group for spot instances."
}

variable "spot_instance_interruption_behavior" {
  type        = string
  default     = null
  description = "Spot instance behavior when interrupted (terminate, stop, or hibernate)."
}

variable "spot_valid_until" {
  type        = string
  default     = null
  description = "End date/time for spot request in UTC RFC3339 format."
}

variable "spot_valid_from" {
  type        = string
  default     = null
  description = "Start date/time for spot request in UTC RFC3339 format."
}

variable "spot_instance_tags" {
  type        = map(any)
  default     = {}
  description = "Additional tags for spot instances."
}
