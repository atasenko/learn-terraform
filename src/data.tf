data template_file "ssh_public_key" {
  template = file("${path.module}/cloud-init.yml")

  vars = {
    username = var.username
    ssh_key  = file("~/.ssh/id_ed25519.pub")
  }
}
