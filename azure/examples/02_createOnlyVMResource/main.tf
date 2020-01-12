# configure the Azure Provider
provider "azurerm" {
}

data "azurerm_resource_group" "resource_group"{
  name			= "BFH_Cloud"
}

data "azurerm_virtual_network" "test" {
  name                  = "BFH_Cloud-vnet"
  resource_group_name	= "${data.azurerm_resource_group.resource_group.name}"
}

data "azurerm_subnet" "test" {
  name			= "default"
  resource_group_name	= "${data.azurerm_resource_group.resource_group.name}"
  virtual_network_name	= "${data.azurerm_virtual_network.test.name}"
}

# create public IP
resource "azurerm_public_ip" "test" {
    name                         = "myPublicIP02-test"
    location                     = "${data.azurerm_resource_group.resource_group.location}"
    resource_group_name          = "${data.azurerm_resource_group.resource_group.name}"
    public_ip_address_allocation = "dynamic"
}

# create a network interface
resource "azurerm_network_interface" "test" {
  name                = "testVM02-nic"
  location            = "${data.azurerm_resource_group.resource_group.location}"
  resource_group_name = "${data.azurerm_resource_group.resource_group.name}"

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id			  = "${data.azurerm_subnet.test.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${azurerm_public_ip.test.id}"
  }
}

resource "azurerm_virtual_machine" "testVM" {
  name                  = "testVM02"
  location              = "westeurope"
  resource_group_name   = "${data.azurerm_resource_group.resource_group.name}"
  network_interface_ids = ["${azurerm_network_interface.test.id}"]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "testVM02-Disk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "YourPassword$"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}
