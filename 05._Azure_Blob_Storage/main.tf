terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  required_version = ">= 0.14"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "exampleResources"
  location = "<YOUR_RESOURCE_GROUP_LOCATION>" # Example: "East US"
}

resource "azurerm_storage_account" "sa" {
  name                     = "<YOUR_STORAGE_ACCOUNT_NAME>" # Name must be unique across Azure
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "sc" {
  name                  = "<YOUR_CONTAINER_NAME>"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}
