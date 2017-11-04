resource "digitalocean_droplet" "letto-backend-www-1" {
  image = "docker"
  name = "letto-backend-www-1"
  region = "nyc3"
  size = "512mb"
  private_networking = true
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]

  connection {
    user = "root"
    type = "ssh"
    private_key = "${file(var.priv_key)}"
    timeout = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose",
      "sudo chmod +x /usr/local/bin/docker-compose"
    ]
  }

  provisioner "file" {
    source      = "/home/ubuntu/letto_data"
    destination = "/root"
  }

  provisioner "file" {
    source      = "/home/ubuntu/projects/letto_backend"
    destination = "/root"
  }

  provisioner "remote-exec" {
    inline = [
      "cd /root/letto_backend && sudo docker-compose build && docker-compose up -d web"
    ]
  }
}

resource "digitalocean_floating_ip" "letto-backend-www-1" {
  droplet_id = "${digitalocean_droplet.letto-backend-www-1.id}"
  region     = "${digitalocean_droplet.letto-backend-www-1.region}"
}
