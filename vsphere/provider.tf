provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server 

  # If you have a self-signed cert
  allow_unverified_ssl = true
}



data "vsphere_datacenter" "dc" {
  name = "RND2"
}

data "vsphere_datastore" "datastore" {
  name = "RND2Vol1"
  #name = "RND2Vol2"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "RND2_Cluster"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "centos_template" {
  name          = var.centos_template  
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}