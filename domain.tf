resource "digitalocean_record" "letto_softr_li" {
  domain = "softr.li"
  type   = "A"
  name   = "letto"
  value = "${digitalocean_droplet.letto-backend-www-1.ipv4_address}"
  ttl = "120"
}
