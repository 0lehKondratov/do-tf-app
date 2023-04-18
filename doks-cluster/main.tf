resource "digitalocean_kubernetes_cluster" "kube1" {
  name    = var.cluster_name
  region  = var.cluster_region
  version = var.cluster_version

  node_pool {
    name       = "mikro"
    size       = var.worker_size
    node_count = var.worker_count
  }
}
