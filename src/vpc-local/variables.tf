variable "env_name" {
  type    = string
  default = null
}

variable "subnet_zone" {
  type = string
}

variable "cidr" {
  type    = list(string)
}
