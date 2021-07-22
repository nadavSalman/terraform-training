/*
This is the 'main' Terraform file. It calls all of our modules in order to
bring up the whole infrastructure
*/




module "centos" {
  

  for_each = var.cluster_nodes
  source = "./modules/centos"
  nodename = "${each.value.name}"
  address = "${each.value.ip}"
  
  # pass vspherer data source 

  # Vsphere
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  
  # VM data
  centos_num_cpus = var.centos_nodes_cpu
  centos_memory   = var.centos_nodes_ram_size
  centos_guest_id = "${data.vsphere_virtual_machine.centos_template.guest_id}"
  centos_scsi_type = "${data.vsphere_virtual_machine.centos_template.scsi_type}"
  
  centos_network_id = data.vsphere_network.network.id

  centos_disk_label            = "disk0"
  centos_disk_size             = var.centos_nodes_local_disk
  centos_disk_eagerly_scrub    = "${data.vsphere_virtual_machine.centos_template.disks.0.eagerly_scrub}"
  centos_disk_thin_provisioned = "${data.vsphere_virtual_machine.centos_template.disks.0.thin_provisioned}"

  centos_template_uuid = "${data.vsphere_virtual_machine.centos_template.id}"
}




 resource "local_file" "ansible_inventory" {
  content = templatefile("/Users/nsalman/dev-devops/installation-13/tf-test/templates/config.tmpl",tomap({cluster_nodes=var.cluster_nodes}))
  filename = "inventory"
}
