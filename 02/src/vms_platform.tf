variable "vm_db_instance_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Instance name"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "Yandex Cloud platform id"
}

variable "vm_db_cpu_cores" {
  type        = number
  default     = 2
  description = "VM CPU cores"
}

variable "vm_db_memory" {
  type        = number
  default     = 2
  description = "VM RAM in Gb"
}

variable "vm_db_core_fraction" {
  type        = number
  default     = 20
  description = "Core fraction"
}
