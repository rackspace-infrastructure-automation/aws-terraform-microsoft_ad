variable "name" {
  description = "The fully qualified name for the Microsoft Active Directory in AWS, such as corp.example.com. The name doesn't need to be publicly resolvable; it will resolve inside your VPC only."
  type        = "string"
}

variable "environment" {
  description = "Application environment for which this network is being created. one of: ('Development', 'Integration', 'PreProduction', 'Production', 'QA', 'Staging', 'Test')"
  type        = "string"
  default     = "Development"
}

variable "password" {
  description = "The password for the default administrative user, Admin."
  type        = "string"
}

variable "vpc_id" {
  description = "The VPC ID in which to create the Microsoft Active Directory server."
  type        = "string"
}

variable "subnet_ids" {
  description = "A list of at least two subnet IDs for the directory servers. Each subnet must be in different Availability Zones (AZs). AWS Directory Service creates a directory server and a DNS server in each subnet."
  type        = "list"
}

variable "alias" {
  description = "A unique alias to assign to the Microsoft Active Directory in AWS. AWS Directory Service uses the alias to construct the access URL for the directory, such as http://alias.awsapps.com."
  type        = "string"
  default     = ""
}

variable "description" {
  description = "A textual description for the directory (OPTIONAL)"
  default     = ""
  type        = "string"
}

variable "short_name" {
  description = "The NetBIOS name for your domain, such as CORP. If you don't specify a value, AWS Directory Service uses the first part of your directory DNS server name. For example, if your directory DNS server name is corp.example.com, AWS Directory Service specifies CORP for the NetBIOS name."
  default     = ""
  type        = "string"
}

variable "enable_sso" {
  description = "Whether to enable single sign-on for a Microsoft Active Directory in AWS. Single sign-on allows users in your directory to access certain AWS services from a computer joined to the directory without having to enter their credentials separately. If you don't specify a value, AWS CloudFormation disables single sign-on by default."
  type        = "string"
  default     = "false"
}

variable "edition" {
  description = "The MicrosoftAD edition (Standard or Enterprise). Defaults to Enterprise."
  type        = "string"
  default     = "Enterprise"
}
