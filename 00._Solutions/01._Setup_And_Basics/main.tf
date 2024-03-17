terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "North Europe"
}

provider "azurerm" {
  features {}
}
