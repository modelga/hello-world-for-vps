provider "scaleway" {}

resource "tls_private_key" "scaleway_ssh_key" {
  algorithm   = "RSA"
  ecdsa_curve = "P256"
}
