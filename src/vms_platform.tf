variable "vm_web_image_name" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VPC image name"
}

variable "vm_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "Yandex Cloud platform id"
}

variable "vm_web_resources" {
  type    = map(number)
  default = { cores = "2", memory = "1", core_fraction = "5" }
}

variable "vm_db_resources" {
  type = map(number)
  default  = { cores = "2", memory = "2", core_fraction = "20" }
}

variable "vm_metadata" {
  type = map(any)
  default = { serial-port-enable = "1", ssh-keys = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBbXwu94fyLxHhhIEt1sxmIhJoaxHQOobnzuoQVu4DlF fenixad@gmail.com" }
}
