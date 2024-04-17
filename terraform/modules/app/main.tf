terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.94.0"
    }
  }
  required_version = ">= 0.13"
}
resource "yandex_compute_instance" "app" {
  name = "reddit-app"

  labels = {
    tags = "reddit-app"
  }
  platform_id = "standard-v3"
  resources {
    cores  = 2
    core_fraction = 50
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.app_disk_image
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat = true
  }

  metadata = {
  ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  connection {
    type  = "ssh"
    host  = yandex_compute_instance.app.network_interface.0.nat_ip_address
    user  = "ubuntu"
    agent = false
    # путь до приватного ключа
    private_key = file(var.private_key_path)
  }

#  provisioner "remote-exec" {
#    inline = [
#      "sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT",
#      "sudo service iptables save"
#    ]
#  }
}
