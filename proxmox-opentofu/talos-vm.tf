resource "proxmox_virtual_environment_vm" "talso_cp" {
  name      = "talos-cp-01"
  description = "Managed by Terraform - do not change manually"
  node_name = "srv-proxmox"

  agent {
    enabled = true # Because we donwload the talos image with the guest agent installe
  }
   cpu {
    cores        = 2
    type         = "x86-64-v2-AES"  # recommended for modern CPUs
  }

  memory {
    dedicated = 2048
    floating  = 2048 # set equal to dedicated to enable ballooning
  }

  # network

  network_device {
    bridge = "vmbr0"
  }

  # Storage

  disk {
    datastore_id = "local-lvm"
    size         = 32
    interface    = "scsi0"
    file_format  = "raw" # Needs to be Stored in raw beacuse in a lvm Volume this is the only option
  }

  cdrom {
    file_id      = proxmox_virtual_environment_file.talos_guest_agent_image.id
  }
}

resource "proxmox_virtual_environment_file" "talos_guest_agent_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "srv-proxmox"

  source_file {
    path = "https://factory.talos.dev/image/ce4c980550dd2ab1b17bbf2b08801c7eb59418eafe8f279833297925d67c7515/v1.9.4/metal-amd64.iso"
  }
}