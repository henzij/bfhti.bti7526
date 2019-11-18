# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option

variable "do_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "${var.do_token}"
}

# Create a new Droplet in a specific region
resource "digitalocean_droplet" "testDroplet" {
  image    = "ubuntu-18-04-x64"
  name     = "testDroplet01"
  region   = "fra1"
  size     = "s-1vcpu-1gb"
  ssh_keys = [25638434, 25589560]

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "sudo apt-get update",
      "sudo apt-get -y install nginx",
    ]

    connection {
      host        = digitalocean_droplet.testDroplet.ipv4_address
      type        = "ssh"
      private_key = "${file("~/.ssh/ppk")}"
      user        = "root"
      timeout     = "2m"
    }
  }
}
