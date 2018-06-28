variable "digitalocean_api_token" {}

provider "digitalocean" {
  token = "${var.digitalocean_api_token}"
}

resource "digitalocean_droplet" "fuck_server" {
    name = "fuck-server"
    image = "ubuntu-16-04-x64"
    size = "512mb"
    region = "sfo2"
    ipv6 = true
    private_networking = false
    tags = ["${digitalocean_tag.cock.name}"]
    ssh_keys = ["0d:00:ab:28:28:f4:71:b6:75:ab:ef:7b:a2:52:5a:0e"]
    volume_ids = ["${digitalocean_volume.balls.id}"]
}

resource "digitalocean_tag" "cock" {
    name = "cock"
}

resource "digitalocean_domain" "urmom_club" {
    name = "urmom.club"
    ip_address = "${digitalocean_droplet.fuck_server.ipv4_address}"
}

resource "digitalocean_record" "urmom_club" {
    name = "ifuck"
    type = "A"
    domain = "${digitalocean_domain.urmom_club.name}"
    value = "${digitalocean_droplet.fuck_server.ipv4_address}"
}

resource "digitalocean_volume" "balls" {
  region      = "sfo2"
  name        = "baz"
  size        = 100
  description = "dick pics"
}

