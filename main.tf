# Define Terraform provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "christos-tfstate-rg"
    storage_account_name = "christostfu4ld85vo"
    container_name       = "core-tfstate"
    key                  = "terraform-tfstate"
  }
}


# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Provisions an Azure Container Registry.
resource "azurerm_container_registry" "acr" {
  name                     = "containerRegistry1"
  resource_group_name      = azurerm_resource_group.state-rg.name
  location                 = azurerm_resource_group.state-rg.location
  sku                      = "Basic"
  admin_enabled            = true
  georeplication_locations = [var.location]
}
