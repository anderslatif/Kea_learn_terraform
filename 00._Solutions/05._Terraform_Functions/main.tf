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

resource "azurerm_resource_group" "example" {
  name     = "example-group"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  # name                     = "todomustbegloballyunique"
  name                     = "tzzzomustbeglosadz123123"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "example" {
  name                = "example-service-plan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Windows"
  sku_name            = "S1"
}

resource "azurerm_linux_function_app" "example" {
  # name                = "todothismustalsobegloballyunique"
  name                = "todothismustalsobegloball12312"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  service_plan_id     = azurerm_service_plan.example.id

  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "node"
  }

  site_config {
    // Adjustments for Linux. You can specify versions or settings specific to your function's requirements
    // For JavaScript, you may not need to specify a runtime version here.
  }
}

resource "azurerm_function_app_function" "example" {
  name            = "example-function-app-function"
  function_app_id = azurerm_linux_function_app.example.id
  language        = "Javascript"

  file {
    name    = "index.js"
    content = file("exampledata/index.js")
  }

  test_data = jsonencode({
    "name" = "Azure"
  })

  config_json = jsonencode({
    "bindings" = [
      {
        "authLevel" = "function",
        "direction" = "in",
        "methods" = [
          "get",
          "post",
        ],
        "name" = "req",
        "type" = "httpTrigger"
      },
      {
        "direction" = "out",
        "name"      = "$return",
        "type"      = "http"
      },
    ]
  })
}
