resource "kubernetes_namespace" "default" {
  metadata {
    name = var.kubernetes_namespace
  }
}