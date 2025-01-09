variable "location" {
  description = "Azure region for resources"
  default     = "East US"
}

variable "db_password" {
  description = "Admin password for databases"
  type        = string
}

