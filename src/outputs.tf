output "vm_ip" {
  value = {
    external_ip_web = yandex_compute_instance.platform.network_interface.0.nat_ip_address
    external_ip_db  = yandex_compute_instance.platform-db.network_interface.0.nat_ip_address
  }
}
