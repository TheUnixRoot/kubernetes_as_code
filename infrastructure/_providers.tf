provider "kubernetes" {
  host = "localhost:8080"
  config_path    = "~/.kube/config"
  config_context = var.config_context
}
