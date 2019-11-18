# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option

variable "do_token" {}
variable "ssh_key_id" {
  type    = list
  default = []
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

# Create a new Droplet in a specific region
resource "digitalocean_droplet" "testDroplet" {
  image    = "ubuntu-18-04-x64"
  name     = "testDroplet01"
  region   = "fra1"
  size     = "s-1vcpu-1gb"
  ssh_keys = var.ssh_key_id
}

