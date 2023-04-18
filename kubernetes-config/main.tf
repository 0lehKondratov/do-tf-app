terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
#      version = ">= 2.27.1"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
#      version = ">= 2.19.0"
    }
    helm = {
      source  = "hashicorp/helm"
#      version = ">= 2.0.1"
    }
  }
}

data "digitalocean_kubernetes_cluster" "kube1" {
  name = var.cluster_name
}

resource "local_file" "kubeconfig" {
  depends_on = [var.cluster_id]
  count      = var.write_kubeconfig ? 1 : 0
  content    = data.digitalocean_kubernetes_cluster.kube1.kube_config[0].raw_config
  filename   = "${path.root}/kubeconfig"
}

provider "kubernetes" {
  host             = data.digitalocean_kubernetes_cluster.kube1.endpoint
  token            = data.digitalocean_kubernetes_cluster.kube1.kube_config[0].token
    cluster_ca_certificate = base64decode(
    data.digitalocean_kubernetes_cluster.kube1.kube_config[0].cluster_ca_certificate
  )
}

provider "helm" {
  kubernetes {
    host  = data.digitalocean_kubernetes_cluster.kube1.endpoint
    token = data.digitalocean_kubernetes_cluster.kube1.kube_config[0].token
    cluster_ca_certificate = base64decode(
      data.digitalocean_kubernetes_cluster.kube1.kube_config[0].cluster_ca_certificate
    )
  }
}
