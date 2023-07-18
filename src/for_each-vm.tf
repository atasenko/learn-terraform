resource "yandex_compute_instance" "web-vm-for-loop" {
  for_each = var.vm_for_resources
  name = "${each.value.vm_name}"
  depends_on  = [yandex_compute_instance.web-vm-count]

  resources {
    cores = "${each.value.cores}"
    memory = "${each.value.ram}"
    core_fraction = "${each.value.core_fraction}"
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = "${each.value.disk}"
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    ssh-keys           = local.ssh-key
  }
}