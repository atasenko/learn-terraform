variable "vm_web_image_name" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VPC image name"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "Yandex Cloud platform id"
}

variable "vm_web_cpu_cores" {
  type        = number
  default     = 2
  description = "VM CPU cores"
}

variable "vm_web_memory" {
  type        = number
  default     = 1
  description = "VM RAM in Gb"
}

variable "vm_web_core_fraction" {
  type        = number
  default     = 5
  description = "Core fraction"
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
