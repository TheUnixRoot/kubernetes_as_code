resource "kubernetes_namespace" "sealed-secrets" {
  metadata {
    name = "sealed-secrets-ns"
  }
}