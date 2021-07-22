output "node_ip" {
  description = "default ip address of the deployed VM"
  value       = vsphere_virtual_machine.centos-vm.default_ip_address
}