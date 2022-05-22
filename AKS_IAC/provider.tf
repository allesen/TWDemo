terraform {
  required_version = ">= 0.14.8"
}


provider "azurerm" {

  ####Connectivity subscription details###
  #subscription_id = var.app_subscription_id
  #client_id       = var.client_id
  #client_secret   = var.client_secret
  #tenant_id       = var.tenant_id

  features {}
}

## Enable this block, if you want to store the backend state file to Azure Storage account.
#terraform {
#  backend "azurerm" {

  #}
#}

