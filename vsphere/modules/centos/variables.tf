# inheret from root module :
variable "nodename" {
  description = "Name of the Node int hte cluster"
  type        = string
}

variable "address" {
  description = "Name of the Node address int hte cluster"
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

variable "resource_pool_id" {
  description = ""
  type        = string
}

variable "datastore_id" {
  description = ""
  type        = string
}

variable "centos_num_cpus" {
  description = ""
  type        = number
}

variable "centos_memory" {
  description = ""
  type        = number
}

variable "centos_guest_id" {
  description = ""
  type        = string
}

variable "centos_scsi_type" {
  description = ""
  type        = string
}

variable "centos_network_id" {
  description = ""
  type        = string
}

variable "centos_disk_label" {
  description = ""
  type        = string
}

variable "centos_disk_size" {
  description = ""
  type        = string
}

variable "centos_disk_eagerly_scrub" {
  description = ""
  type        = string
}

variable "centos_disk_thin_provisioned" {
  description = ""
  type        = string
}

variable "centos_template_uuid" {
  description = ""
  type        = string
}