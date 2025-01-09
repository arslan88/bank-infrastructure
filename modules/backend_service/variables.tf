variable "name" {
  description = "Service name"
  type        = string
}

variable "rg_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the service"
  type        = string
}

