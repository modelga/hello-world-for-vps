
data "cloudflare_zones" "find_zones" {
  filter {
    name   = var.config.domain
    status = "active"
    paused = false
  }
}

resource "cloudflare_record" "a_record" {
  zone_id = lookup(data.cloudflare_zones.find_zones.zones[0], "id")
  name    = "${var.config.subdomain}%{if var.config.stage == "pro"}%{else}-${var.config.stage}%{endif}"
  value   = scaleway_instance_ip.server_ip.address
  type    = "A"
  ttl     = 300
  proxied = false
}
