# configure the Azure Provider
provider "azurerm" {
}

data "azurerm_resource_group" "resource_group" {
  name = "BFH_Cloud"
}

resource "azurerm_virtual_network" "test" {
  name                = "testnetwork2"
  address_space       = ["10.0.0.0/16"]
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = data.azurerm_resource_group.resource_group.name
}

resource "azurerm_subnet" "test" {
  name                 = "testsubnet2"
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.test.name
  address_prefix       = "10.0.1.0/24"
}

# Create public IP
resource "azurerm_public_ip" "test02" {
  name                         = "myPublicIP-test2"
  location                     = data.azurerm_resource_group.resource_group.location
  resource_group_name          = data.azurerm_resource_group.resource_group.name
  public_ip_address_allocation = "dynamic"
}

# create a network interface
resource "azurerm_network_interface" "test" {
  name                = "nic-test2"
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = data.azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.test.id
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = azurerm_public_ip.test02.id
  }
}

resource "azurerm_virtual_machine" "testDroplet" {
  name                  = "testDroplet02"
  location              = "westeurope"
  resource_group_name   = data.azurerm_resource_group.resource_group.name
  network_interface_ids = [azurerm_network_interface.test.id]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk2"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "emanuel"
    #admin_password = "YourPassword$"
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      path     = "/home/emanuel/.ssh/authorized_keys"
      key_data = file("/home/emanuel/.ssh/rsa_pub_key.pub")
    }
  }
  tags = {
    environment = "staging"
  }
}
