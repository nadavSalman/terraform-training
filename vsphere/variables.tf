# rooot module variable.tf



#  define variables wthiout default assigned 
variable "vsphere_user" {
  type = string
}

variable "vsphere_password" {
  type = string
}


variable "vsphere_server" {
  type = string
}




variable "centos_template" {
  description = "Name of the centos vm template"
  type        = string
}




variable "network-gateway" {
  type    = string
  default = "10.10.9.10"
}


variable "network-dns1" {
  type    = string
  default = "10.10.13.4"
}

variable "subnet-mask" {
  type    = string
  default = 21
}

variable "network-domain" {
  type    = string
  default = "attentigroup.local"
}


# ~~~ centos VM's Cluster variables ~~~

variable "cluster_nodes" {
  description = "centos cluster nodes"
  type = map(map(string))
}

variable "centos_nodes_ram_size" {
  description = "VM RAM size in megabytes."
  default     = 4096
}

variable "centos_nodes_cpu" {
  description = "VM cpu cores"
  default     = 4
}


variable "centos_nodes_local_disk" {
  description =  "VM local disk size"
  default = 50
}