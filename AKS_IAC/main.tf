#---------------------------------------------------------
# Resource Group Creation
#----------------------------------------------------------

resource "azurerm_resource_group" "demorg" {
  count    = var.create_resource_group ? 1 : 0
  name     = "az-rg-${local.prefix}-${var.rg_name}"
  location = var.rg_location
}

#---------------------------------------------------------
# AKS Resource Module
#---------------------------------------------------------

resource "azurerm_kubernetes_cluster" "aks" {
  name                    = "azaks${local.prefix}${var.cluster_name}"
  kubernetes_version      = var.kubernetes_version
  location                = var.rg_location
  resource_group_name     = local.resource_group_name
  dns_prefix              = var.prefix
  sku_tier                = var.sku_tier
  private_cluster_enabled = var.private_cluster_enabled

  default_node_pool {
    name                   = var.agents_pool_name
    node_count             = var.agents_count
    vm_size                = var.agents_size
    os_disk_size_gb        = var.os_disk_size_gb
    vnet_subnet_id         = data.azurerm_subnet.akssubnet.id
    enable_auto_scaling    = var.enable_auto_scaling
    max_count              = var.agents_max_count
    min_count              = var.agents_min_count
    enable_node_public_ip  = var.enable_node_public_ip
    node_labels            = var.agents_labels
    type                   = var.agents_type
    tags                   = merge(var.tags, var.agents_tags)
    max_pods               = var.agents_max_pods
    enable_host_encryption = var.enable_host_encryption
  }

  dynamic "service_principal" {
    for_each = var.client_id != "" && var.client_secret != "" ? ["service_principal"] : []
    content {
      client_id     = var.client_id
      client_secret = var.client_secret
    }
  }

  dynamic "identity" {
    for_each = var.client_id == "" || var.client_secret == "" ? ["identity"] : []
    content {
      type                      = var.identity_type
    }
  }
  tags = var.tags
}