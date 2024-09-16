terraform {
  backend "local" {
    path = "contexttest1.tfstate"
  }
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}