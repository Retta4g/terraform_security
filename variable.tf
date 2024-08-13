variable "aws_region" {
  description = "The AWS region to deploy resources into"
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "my-vpc"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_tags" {
  description = "A map of tags to assign to the VPC"
  type        = map(string)
  default     = {
    "Environment" = "dev"
  }
}

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "my-security-group"
}

variable "security_group_description" {
  description = "The description of the security group"
  type        = string
  default     = "Managed by Terraform"
}

variable "sg_rules" {
  description = "A list of security group rules for ingress and egress"
  type = list(object({
    type        = string                      # "ingress" or "egress"
    from_port   = number                      # Port range start
    to_port     = number                      # Port range end
    protocol    = string                      # Protocol, e.g., "tcp", "udp", "-1" (for all)
    cidr_blocks = optional(list(string))      # CIDR blocks (optional, defaults to ["0.0.0.0/0"])
    description = optional(string)            # Description of the rule (optional)
  }))
  default = [
    {
      type        = "ingress"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow HTTP traffic"
    },
    {
      type        = "ingress"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow HTTPS traffic"
    },
    {
      type        = "egress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow all outbound traffic"
    }
  ]
}

variable "security_group_tags" {
  description = "A map of tags to assign to the security group"
  type        = map(string)
  default     = {
    "Environment" = "dev"
  }
}
