terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.58.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "Asad_rg_1"
    storage_account_name = "asadstatefilestorage"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "11f3bb77-47df-4c33-a394-95f276773f1e"

}