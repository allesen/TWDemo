#####COMMON######

variable "service_line" {
  default     = null
  type        = string
  description = "Provide service_line Name where resources for naming standards"
}

variable "app_name" {
  default     = null
  type        = string
  description = "Provide new App Name that need to be created"
}


variable "env" {
  default     = null
  type        = string
  description = "Provide new Environment Name where resources need to be created"
}

variable "tier" {
  default     = null
  type        = string
  description = "Provide tier Name where resources need to be created"
}

variable "rg_name" {
  type        = string
  description = "Provide name of the new resource group."
}

variable "rgname" {
  type        = string
  description = "Provide name of the existing resource group."
}
variable "rg_location" {
  type        = string
  description = "Provide the location to trigger resources"
}

##-----------------------------------------------
## AKS Variable
##-----------------------------------------------

variable "akssubnetname" {
  description = "Name of the Subnet for AKS"
  type        = string
}
variable "aksrgsubnetname" {
  description = "Name of the resource group for the Subnet for AKS"
  type        = string
}
variable "aksvnetname" {
  description = "Name of the VNET for the Subnet for AKS"
  type        = string
}

variable "prefix" {
  description = "(Required) The prefix for the resources created in the specified Azure Resource Group"
  type        = string
}


variable "cluster_name" {
  description = "(Optional) The name for the AKS resources created in the specified Azure Resource Group. This variable overwrites the 'prefix' var (The 'prefix' var will still be applied to the dns_prefix if it is set)"
  type        = string
  default     = null
}


variable "client_id" {
  description = "(Optional) The Client ID (appId) for the Service Principal used for the AKS deployment"
  type        = string
  default     = ""
}

variable "client_secret" {
  description = "(Optional) The Client Secret (password) for the Service Principal used for the AKS deployment"
  type        = string
  default     = ""
}

variable "agents_size" {
  description = "The default virtual machine size for the Kubernetes agents"
  type        = string
}

variable "agents_count" {
  description = "The number of Agents that should exist in the Agent Pool. Please set `agents_count` `null` while `enable_auto_scaling` is `true` to avoid possible `agents_count` changes."
  type        = number
}

variable "tags" {
  type        = map(string)
  description = "Any tags that should be present on the AKS"
  default     = {}
}

variable "os_disk_size_gb" {
  description = "Disk size of nodes in GBs."
  type        = number
}

variable "private_cluster_enabled" {
  description = "If true cluster API server will be exposed only on internal IP address and available only in cluster vnet."
  type        = bool
}

variable "sku_tier" {
  description = "The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free and Paid"
  type        = string
  default     = "Free"
}

variable "create_resource_group" {
  description = "Enable new resource group creation."
  type        = bool
}
variable "network_plugin" {
  description = "Network plugin to use for networking."
  type        = string
  default     = "kubenet"
}

variable "kubernetes_version" {
  description = "Specify which Kubernetes release to use. The default used is the latest Kubernetes version available in the region"
  type        = string
  default     = null
}

variable "enable_auto_scaling" {
  description = "Enable node pool autoscaling"
  type        = bool
  default     = false
}

variable "agents_max_count" {
  type        = number
  description = "Maximum number of nodes in a pool"
  default     = null
}

variable "agents_min_count" {
  type        = number
  description = "Minimum number of nodes in a pool"
  default     = null
}

variable "agents_pool_name" {
  description = "The default Azure AKS agentpool (nodepool) name."
  type        = string
  default     = "nodepool"
}

variable "enable_node_public_ip" {
  description = "(Optional) Should nodes in this Node Pool have a Public IP Address? Defaults to false."
  type        = bool
  default     = false
}

variable "agents_labels" {
  description = "(Optional) A map of Kubernetes labels which should be applied to nodes in the Default Node Pool. Changing this forces a new resource to be created."
  type        = map(string)
  default     = {}
}

variable "agents_type" {
  description = "(Optional) The type of Node Pool which should be created. Possible values are AvailabilitySet and VirtualMachineScaleSets. Defaults to VirtualMachineScaleSets."
  type        = string
  default     = "VirtualMachineScaleSets"
}

variable "agents_tags" {
  description = "(Optional) A mapping of tags to assign to the Node Pool."
  type        = map(string)
  default     = {}
}

variable "agents_max_pods" {
  description = "(Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created."
  type        = number
  default     = null
}

variable "identity_type" {
  description = "(Optional) The type of identity used for the managed cluster. Conflict with `client_id` and `client_secret`. Possible values are `SystemAssigned` and `UserAssigned`. If `UserAssigned` is set, a `user_assigned_identity_id` must be set as well."
  type        = string
  default     = "SystemAssigned"
}

variable "user_assigned_identity_id" {
  description = "(Optional) The ID of a user assigned identity."
  type        = string
  default     = null
}

variable "enable_host_encryption" {
  description = "Enable Host Encryption for default node pool. Encryption at host feature must be enabled on the subscription: https://docs.microsoft.com/azure/virtual-machines/linux/disks-enable-host-based-encryption-cli"
  type        = bool
  default     = false
}