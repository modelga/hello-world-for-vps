variable "domain" {
  default = "schibsted.ga"
}

variable "subdomain" {
  default = "lotto"
}
variable "vps_instance_type" {
  default = "DEV1-S"
}

variable "config" {
  type    = map
  default = {}
}
## Secrets
variable "SCW_ACCESS_KEY" {
}

variable "SCW_SECRET_KEY" {
}

variable "SCW_ORGANIZATION_ID" {
}

variable "CLOUDFLARE_EMAIL" {

}

variable "CLOUDFLARE_API_KEY" {

}
