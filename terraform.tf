resource "azurerm_resource_group" "name" {
    name     = "rg-terraform"
    location = "East US"
  }

resource "azurerm_storage_account" "name" {
    name                     = "stterraform"
    resource_group_name      = azurerm_resource_group.name.name
    location                 = azurerm_resource_group.name.location
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
  resource "azurerm_storage_container" "name" {
    name                  = "tfstate"
    storage_account_name  = azurerm_storage_account.name.name
    container_access_type = "private"
  }
  output "storage_account_name" {
    value = azurerm_storage_account.name.name
  }
  output "storage_container_name" {
    value = azurerm_storage_container.name.name
  }   