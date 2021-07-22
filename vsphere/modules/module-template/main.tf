
# Create K8s cluster infrastructure

resource "vsphere_virtual_machine" "vm" {
  
  # inhereted from root module
  name = var.nodename

  resource_pool_id = var.resource_pool_id
  datastore_id     = var.datastore_id

  num_cpus = var.centos_num_cpus
  memory   = var.centos_memory
  guest_id = var.centos_guest_id

  scsi_type = var.centos_scsi_type


  network_interface {
      network_id = var.centos_network_id
  }

  disk {
    label            = "${var.centos_disk_label}_disk1"
    size             = var.centos_disk_size # 100
    eagerly_scrub    = var.centos_disk_eagerly_scrub
    thin_provisioned = var.centos_disk_thin_provisioned
  }

  clone {
    template_uuid = var.centos_template_uuid

    customize {
      linux_options {
        host_name = var.nodename
        domain    = "${var.network-domain}"
      }

      network_interface {
        ipv4_address    = var.address
        ipv4_netmask    = "${var.subnet-mask}"
      }

      dns_server_list = ["${var.network-dns1}"]
      ipv4_gateway = "${var.network-gateway}"
    }
 
  }
}


