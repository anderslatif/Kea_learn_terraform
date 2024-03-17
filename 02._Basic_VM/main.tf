terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.83.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = "terraform-introduction-resources"
  location = "North Europe"
}

resource "azurerm_virtual_network" "main" {
  name                = "terraform-introduction-network"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "main" {
  name                 = "terraform-introduction-subnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.0.0/24"]
}

# Creates a Network Interface Card (NIC) and assigns it to the subnet
resource "azurerm_network_interface" "internal" {
  name                = "terraform-introduction-network-interface"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.main.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  name                = "terraform-introduction-vm"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = "Standard_B1s"

  network_interface_ids = [
    azurerm_network_interface.internal.id,
  ]

  disable_password_authentication = false
  admin_username                  = "azureuser"
  admin_password                  = "Password1234!" 

  computer_name = "terraform-introduction-vm"
  os_disk {
    name                 = "terraform-introduction-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

}