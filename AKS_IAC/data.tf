#------------------------------------
#Fetch the azure configs
#------------------------------------

data "azurerm_client_config" "current" {}

#------------------------------------
#Fetch the existing resource group details
#------------------------------------

data "azurerm_resource_group" "rg" {
  count = var.create_resource_group == false ? 1 : 0
  name = var.rgname
}
#------------------------------------
#Fetch VNETS / Subnets AKS
#------------------------------------

data "azurerm_subnet" "akssubnet" {
  name = var.akssubnetname
  resource_group_name = var.aksrgsubnetname
  virtual_network_name = var.aksvnetname
}