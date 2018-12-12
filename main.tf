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
  alias       = "${var.alias}"
  description = "${var.description}"
  enable_sso  = "${var.enable_sso}"
  name        = "${var.name}"
  password    = "${var.password}"
  edition     = "${var.edition}"
  type        = "MicrosoftAD"
  short_name  = "${var.short_name}"

  vpc_settings {
    vpc_id     = "${var.vpc_id}"
    subnet_ids = ["${var.subnet_ids}"]
  }

  tags {
    ServiceProvider = "Rackspace"
    Environment     = "${var.environment}"
    Name            = "${var.name}"
  }
}
