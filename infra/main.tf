provider "scaleway" {
  access_key      = var.SCW_ACCESS_KEY
  secret_key      = var.SCW_SECRET_KEY
  organization_id = var.SCW_ORGANIZATION_ID
  zone            = "fr-par-1"
  region          = "fr-par"
}
provider "cloudflare" {
  email   = var.CLOUDFLARE_EMAIL
  api_key = var.CLOUDFLARE_API_KEY
}

locals {
  config = {
    domain            = var.domain
    vps_instance_type = var.vps_instance_type
    subdomain         = var.subdomain
  }
}

module "stack" {
  source = "../stack"
  config = merge(local.config, var.config)
}

output "ip" {
  value = module.stack.ip
}

output "private_key" {
  value     = module.stack.private_key
  sensitive = true
}
