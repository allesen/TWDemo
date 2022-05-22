
#####Naming convention-Common for this script####

service_line = "demo"
env          = "nprd"
tier         = "az"



########Connection#######
client_id     = "7d004623-fb83-462a-950c-f1529cf73bb7"
client_secret = "Q77dS39xLG-hDEc5uxhgkhGaqFXhLTx3.d"
tenant_id     = "9b67fde0-7d27-4c41-ad92-0e6f22e3676c"


tags = {

  "Environment"  = "nprd"
  "Service Line" = "demo"
  "Created-By"   = "Terraform-IAC"

}

#--------------------------------------------------------
###########Resource Group#########################
#--------------------------------------------------------
create_resource_group         = true
rg_name                       = "01" ## custom suffix name
rgname                        = null ##Name of the existing resource group.
rg_location                   = "West India"

#--------------------------------------------------------
###########AKS#########################
#--------------------------------------------------------
cluster_name = "01"
prefix = "prefix"
os_disk_size_gb = "50"
kubernetes_version = "1.21.2"
agents_max_count = null
agents_min_count = null
sku_tier = "Free"
private_cluster_enabled = "false"
enable_auto_scaling = "false"
enable_node_public_ip = "false"
agents_availability_zones = null
agents_labels = {
  "nodepool" : "defaultnodepool"
}
agents_type = "VirtualMachineScaleSets"
agents_tags = {
  "Agent" : "defaultnodepoolagent"
}
agents_max_pods = null
enable_host_encryption = "false"
agents_size = "Standard_D8s_v3"
agents_count = 2
agents_pool_name = "nodepool"
akssubnetname = "demosubnet"
aksrgsubnetname = "Demo"
aksvnetname = "demo"