provider "scaleway" {
  access_key      = var.SCW_ACCESS_KEY
  secret_key      = var.SCW_SECRET_KEY
  organization_id = var.SCW_ORGANIZATION_ID
  zone            = "fr-par-1"
  region          = "fr-par"
}

resource "tls_private_key" "scaleway_ssh_key" {
  algorithm   = "RSA"
  ecdsa_curve = "P256"
  rsa_bits    = 2048
}

resource "scaleway_account_ssh_key" "scw_ssh_key" {
  name       = "main-ssh-key"
  public_key = tls_private_key.scaleway_ssh_key.public_key_openssh
}

resource "scaleway_instance_ip" "server_ip" {}


resource "scaleway_instance_security_group" "allow_all" {
  name = "Allow All"
}

resource "scaleway_instance_server" "vps_dev_server" {
  name              = "vps-1-dev"
  type              = "DEV1-S"
  image             = "docker"
  security_group_id = scaleway_instance_security_group.allow_all.id

  ip_id = scaleway_instance_ip.server_ip.id
}
