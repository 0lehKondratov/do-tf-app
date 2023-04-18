output "cluster_id" {
  value = digitalocean_kubernetes_cluster.kube1.id
}

output "cluster_name" {
  value = digitalocean_kubernetes_cluster.kube1.name
}
