output "id" {
  description = "The directory identifier."
  value       = "${aws_directory_service_directory.msad.id}"
}

output "access_url" {
  description = "The access URL for the directory"
  value       = "${aws_directory_service_directory.msad.access_url}"
}

output "dns_ip_addresses" {
  description = "A list of IP addresses of the DNS servers for the directory or connector"
  value       = "${aws_directory_service_directory.msad.dns_ip_addresses}"
}

output "security_group_id" {
  description = "The ID of the security group created by the directory"
  value       = "${aws_directory_service_directory.msad.security_group_id}"
}
