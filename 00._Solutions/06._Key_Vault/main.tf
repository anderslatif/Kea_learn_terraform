provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_key_vault" "example" {
  # TODO: the name has to be globally unique
  name                        = "todohastobegloballyunique"
  location                    = azurerm_resource_group.example.location
  resource_group_name         = azurerm_resource_group.example.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get"
    ]

    secret_permissions = [
      "Get", "List", "Delete", "Set"
    ]

    storage_permissions = [
      "Get", "List", "Delete", "Set"
    ]
  }
}

resource "azurerm_key_vault_secret" "example" {
  name         = "example-secret"
  value        = "mySecretValue"
  key_vault_id = azurerm_key_vault.example.id
}

data "azurerm_key_vault_secret" "example" {
  name         = "example-secret"
  key_vault_id = azurerm_key_vault.example.id
}


# Note: Exposing secrets in output is a security risk. This is for example purposes only.
output "secret_value" {
  value = data.azurerm_key_vault_secret.example.value
#   required otherwise, Terraform will not perform that action since it is aware that a secret is being exposed
  sensitive = true
}
