terraform {
  backend "local" {
    path = "contexttest1.tfstate"
  }
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    helm = {
      source = "hashicorp/helm"
      version = "2.15.0"
    }
  }
}