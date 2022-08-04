output "ip_pub" {
  value = aws_instance.app_server.public_ip
}

output "ip_pub_dns" {
  value = aws_instance.app_server.public_dns
}

# output "IP_publico" {
#   value = aws_instance.app_server.public_ip
# }