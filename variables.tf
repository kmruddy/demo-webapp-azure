variable "subscription_id" {
  description = "The subscription ID of the Azure resources to be used."
}

variable "client_id" {
  description = "The client ID of the Azure user to be used."
}

variable "client_secret" {
  description = "The client secret or password of the Azure user to be used."
}

variable "tenant_id" {
  description = "The tenant ID of the Azure resources to be used."
}

variable "resource_group" {
  default = "Ruddy-Demo-RG"
}

variable "storage_account_name" {
  default = "ruddystorageaccountone"
}

variable "storage_container_name" {
  default = "ruddycontainerone"
}

variable "storage_blob_name" {
  default = "ruddystorageblobdemo"
}
