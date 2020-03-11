/**
*# aws-terraform-microsoft_ad
*
*This module will create a Microsoft Active Directory using AWS Directroy Services.
*
*## Basic Usage
*
*```
*module "msad" {
*  source     = "git@github.com:rackspace-infrastructure-automation/aws-terraform-microsoft_ad//?ref=v0.0.1"
*  name       = "corp.example.local"
*  password   = "${data.aws_kms_secrets.ad_credentials.plaintext["password"]}"
*  vpc_id     = "${module.vpc.vpc_id}"
*  subnet_ids = "${module.vpc.private_subnets}"
*  short_name = "corp"
*}
*```
*/

resource "aws_directory_service_directory" "msad" {
  alias       = var.alias
  description = var.description
  edition     = var.edition
  enable_sso  = var.enable_sso
  name        = var.name
  password    = var.password
  short_name  = var.short_name
  type        = "MicrosoftAD"

  vpc_settings {
    subnet_ids = var.subnet_ids
    vpc_id     = var.vpc_id
  }

  tags = {
    Environment     = var.environment
    Name            = var.name
    ServiceProvider = "Rackspace"
  }
}

