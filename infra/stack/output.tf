output "private_key" {
  value     = tls_private_key.scaleway_ssh_key.private_key_pem
  sensitive = true
}
output "ip" {
  value = scaleway_instance_ip.server_ip.address
}
