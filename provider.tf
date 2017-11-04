variable "do_token" {}
variable "pub_key" {}
variable "priv_key" {}
variable "ssh_fingerprint" {}

provider "digitalocean" {
  token = "${var.do_token}"
}
