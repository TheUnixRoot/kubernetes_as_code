resource "helm_release" "argocd" {

  name = "argocd"
  namespace = "argocd"
  create_namespace = true
  repository = "https://argoproj.github.io/argo-helm"
  chart = var.argocd.name
  version = var.argocd.version

}