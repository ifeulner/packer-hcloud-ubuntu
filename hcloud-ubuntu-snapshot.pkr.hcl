variable "hcloud_token" {
  type    = string
  default = "${env("HCLOUD_TOKEN")}"
}

source "hcloud" "ubuntu-snapshot" {
  image       = "ubuntu-20.04"
  location    = "nbg1"
  server_type = "cx11"
  snapshot_labels = {
    ubuntu-snapshot = "yes"
  }
  snapshot_name = "ubuntu-snapshot"
  ssh_username  = "root"
  token         = "${var.hcloud_token}"
}

build {
  sources = ["source.hcloud.ubuntu-snapshot"]

  provisioner "shell" {
    script = "scripts/ansible.sh"
  }

  provisioner "ansible-local" {
    galaxy_file   = "ansible/requirements.yml"
    playbook_dir  = "ansible"
    playbook_file = "ansible/main.yml"
  }

  provisioner "shell" {
    script = "scripts/cleanup.sh"
  }
}
