module "vpc_develop" {
  source      = "./vpc-local"
  env_name    = var.env_name
  subnet_zone = var.default_zone
  cidr        = var.default_cidr
}

module "test-vm" {
  source          = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name        = var.env_name
  network_id      = module.vpc_develop.network_id
  subnet_zones    = [ module.vpc_develop.subnet_zones ]
  subnet_ids      = [ module.vpc_develop.subnet_ids ]
  instance_name   = "web"
  instance_count  = 1
  image_family    = "ubuntu-2004-lts"
  public_ip       = true

  metadata = {
      user-data          = data.template_file.ssh_public_key.rendered
      serial-port-enable = 1
  }
}
