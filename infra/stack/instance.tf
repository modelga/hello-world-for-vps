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
  name = "Allow All (${var.config.stage})"
}

resource "random_pet" "server_name" {
  keepers = {
    instance_type = var.config.vps_instance_type
  }
  prefix    = "vps-${var.config.stage}"
  separator = "-"
  length    = 2
}

resource "scaleway_instance_server" "vps_dev_server" {
  name              = random_pet.server_name.id
  type              = var.config.vps_instance_type
  image             = "docker"
  security_group_id = scaleway_instance_security_group.allow_all.id

  ip_id = scaleway_instance_ip.server_ip.id
}

provider "random" {

}
