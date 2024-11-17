terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.11.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "kytfstate"
    storage_account_name = "kayystorage"
    container_name       = "kytfcontainer"
    key                  = "terraform.tfstate"
  }

}
provider "azurerm" {
  features {}
  subscription_id = "7fdf605c-e6b5-4f51-b9c0-27d0799ce221"
}


