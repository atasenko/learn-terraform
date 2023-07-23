resource "yandex_compute_disk" "storage" {
  count    = 3
  name     = "task3-disk-${count.index}"
  size     = 1
}

resource "yandex_compute_instance" "storage" {
  name        = "storage"

  resources {
    cores         = var.vm_web_resources.cores
    memory        = var.vm_web_resources.memory
    core_fraction = var.vm_web_resources.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage.*.id
    content {
      disk_id = secondary_disk.value
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    ssh-keys           = local.ssh-key
  }
}
