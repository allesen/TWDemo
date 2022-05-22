
locals {
  resource_group_name      = element(coalescelist(data.azurerm_resource_group.rg.*.name, azurerm_resource_group.demorg.*.name, [""]), 0)
  prefix                   = "${var.service_line}${var.env}${var.tier}"
}