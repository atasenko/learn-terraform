###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "vm_image_name" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VPC image name"
}

variable "vm_for_resources" {
  description = "Resource list for task 2"
  type = list(any)
  default = [
    {
      name          = "main"
      description   = "Main virtual machine"
      cores         = 4
      ram           = 2
      core_fraction = 20
      disk          = 20
    },
    {
      name          = "replica"
      description   = "Replica virtual machine"
      cores         = 2
      ram           = 1
      core_fraction = 5
      disk          = 10
    }
  ]
}

variable "vm_web_resources" {
  type = map(number)
  default  = { cores = "2", memory = "2", core_fraction = "5" }
}
