output "hosts" {
  value = [
    for e in local.servers : {
      name = e.name,
      id   = e.id,
      fqdn = e.fqdn
    }
  ]
}

locals {
  servers = flatten([
    yandex_compute_instance.webservers[*],
    [for i, e in yandex_compute_instance.databases : e],
    yandex_compute_instance.storage
    ]
  )
}
