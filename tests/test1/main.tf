terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region  = "us-west-2"
  version = "~> 2.1"
}

resource "random_string" "password" {
  length      = 16
  min_lower   = 1
  min_numeric = 1
  min_upper   = 1
  special     = false
}

resource "random_string" "alias_name" {
  length  = 15
  lower   = true
  number  = false
  special = false
  upper   = false
}

module "vpc" {
  source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-vpc_basenetwork//?ref=v0.12.0"

  name = "ad_vpc"
}

module "msad" {
  source = "../../module"

  alias      = "${random_string.alias_name.result}-examplead"
  enable_sso = "true"
  name       = "corp.example.local"
  password   = random_string.password.result
  short_name = "corp"
  subnet_ids = module.vpc.private_subnets
  vpc_id     = module.vpc.vpc_id
}

