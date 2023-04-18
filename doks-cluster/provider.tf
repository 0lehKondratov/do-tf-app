terraform {
  required_providers {
    github = {
      source  = "integrations/github"
#      version = "~> 4.12.2"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
#      version = "~> 2.27.1"

    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
#      version = "~> 2.19.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
#      version = "~> 1.11.2"
    }

    tls = {
      source  = "hashicorp/tls"
#      version = "~> 3.1.0"
    }
  }
}

provider "kubectl" {
  host  = digitalocean_kubernetes_cluster.kube1.endpoint
  token = digitalocean_kubernetes_cluster.kube1.kube_config[0].token
  cluster_ca_certificate = base64decode(
    digitalocean_kubernetes_cluster.kube1.kube_config[0].cluster_ca_certificate
  )
  load_config_file = false
}

provider "kubernetes" {
  host  = digitalocean_kubernetes_cluster.kube1.endpoint
  token = digitalocean_kubernetes_cluster.kube1.kube_config[0].token
  cluster_ca_certificate = base64decode(
    digitalocean_kubernetes_cluster.kube1.kube_config[0].cluster_ca_certificate
  )
}