# Create public IP
data "azurerm_public_ip" "test02" {
  name                = "myPublicIP-test2"
  resource_group_name = "BFH_Cloud"

}

resource "null_resource" "test" {
  provisioner "remote-exec" {
    connection {
      host        = data.azurerm_public_ip.test02.ip_address
      user        = "emanuel"
      type        = "ssh"
      private_key = "${file("/home/emanuel/.ssh/id_rsa")}"
      timeout     = "10m"
    }

    inline = [
      "sudo apt-get update",
      "sudo apt-get -y install nginx",
    ]
  }
}
