terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
}
# Terraform Provider Block
provider "azurerm" {
  features {}
  subscription_id = "845670d0-6329-46a7-97a7-fe36dbdce51b"
}
# terraform {
#   backend "azurerm" {
#     resource_group_name  = "jaydeep_rg1"
#     storage_account_name = "jaydeepstg678"
#     container_name       = "jaydeepcnt678"
#     key                  = "terraform.tfstate"

#   }
# }