output "node_resource_group" {
  value = azurerm_kubernetes_cluster.aks.resource_group_name
}

output "location" {
  value = azurerm_kubernetes_cluster.aks.location
}

output "name" {
  value = azurerm_kubernetes_cluster.aks.name
}
