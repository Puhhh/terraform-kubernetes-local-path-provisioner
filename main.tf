terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }

    helm = {
      source = "hashicorp/helm"
    }
  }

  backend "s3" {
    bucket = "terraform-kubernetes-puhhh-s3"
    key    = "test/local-path-provisioner/terraform.tfstate"
    region = "eu-north-1"
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
