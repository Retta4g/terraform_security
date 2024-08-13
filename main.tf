provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source     = "./modules/vpc"
  name       = var.vpc_name
  cidr_block = var.vpc_cidr_block
  tags       = var.vpc_tags
}

module "my_security_group" {
  source      = "./modules/security_group"
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = module.vpc.vpc_id

  sg_rules = var.sg_rules
  tags     = var.security_group_tags
}
