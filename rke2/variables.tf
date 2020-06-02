variable "server_instance_type" {
  # default = "c4.8xlarge"
}

variable "rke2_version" {
  default     = "v0.9.1"
  type        = string
  description = "Version of K3S to install"
}

variable "rke2_server_args" {
  default = ""
}

variable "rke2_agent_args" {
  default = ""
}

variable "rke2_cluster_secret" {
  type        = string
  description = "Cluster secret for rke2 cluster registration"
}

variable "ssh_key_path" {
  default = "~/.ssh/id_rsa"
  type = string
  description = "Path of the private key to ssh to the nodes"
}

variable "extra_ssh_keys" {
  type        = list
  default     = []
  description = "Extra ssh keys to inject into Rancher instances"
}

variable "server_ha" {
  default     = 0
  description = "Enable rke2 in HA mode"
}

variable "server_count" {
  default     = 1
  description = "Count of rke2 master servers"
}

variable "debug" {
  default     = 0
  description = "Enable Debug log"
}

variable "domain_name" {
  description = "FQDN of the cluster"
}

variable "zone_id" {
  description = "route53 zone id to register the domain name"
}

variable "name" {}

variable "rke2_arch" {
  default = "amd64"
}

variable "agent_node_count" {}

variable "agent_instance_type" {
}
