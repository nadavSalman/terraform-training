

output "centos_vms_cluster_nodes_name_nad_ip" {
  description = "default ip address of the deployed VM"  
  value = [for k , v  in var.cluster_nodes : {name=v.name , ip=v.ip}]
}


output "my_template" {
  value = templatefile("/Users/nsalman/dev-devops/installation-13/tf-test/templates/config.tmpl",tomap({cluster_nodes=var.cluster_nodes}))
  sensitive = true
}






