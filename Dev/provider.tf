terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.30.0"
    }
  }
}
# Terraform Provider Block
provider "azurerm" {
  features {}
  subscription_id = ""
}
# terraform {
#   backend "azurerm" {
#     resource_group_name  = "jaydeep_rg"
#     storage_account_name = "jaydeepstg321"
#     container_name       = "jaydeepcnt321"
#     key                  = "terraform.tfstate"

#   }
#  }
