terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }

    helm = {
      source = "hashicorp/helm"
    }
  }
}

provider "kubernetes" {
  config_path = var.kubeconfig-path
}

provider "helm" {
  kubernetes {
    config_path = var.kubeconfig-path
  }
}