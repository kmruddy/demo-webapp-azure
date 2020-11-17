terraform {
  backend "remote" {
    organization = "TMM-Org"

    workspaces {
      name = "webapp"
    }
  }
}

provider "azurerm" {
  version = "2.22.0"
  features {}
  
  subscription_id = var.subscription_id
  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id
}

data "azurerm_resource_group" "rg"{
  name     = var.resource_group
}

resource "azurerm_storage_account" "webapp" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "webapp" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.webapp.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "webapp" {
  name                   = var.storage_blob_name
  storage_account_name   = azurerm_storage_account.webapp.name
  storage_container_name = azurerm_storage_container.webapp.name
  type                   = "Block"
}
