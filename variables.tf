variable "cluster_version" {
  description = "Kubernetes version provided by DOKS"
  type        = string
  default     = "1.26" 
}

variable "worker_count" {
  default = 3
}

variable "worker_size" {
  default = "s-1vcpu-2gb"
}

variable "write_kubeconfig" {
  type        = bool
  default     = true
}

variable "ssh_key" {
  description = "Digital Ocean ssh key"
  type        = string
}

variable "cluster_name" {
  description = "DOKS cluster name"
  type        = string
}

variable "cluster_region" {
  description = "DOKS cluster region"
  type        = string
}




