variable "config_context" {
  type = string
}

variable "kubernetes_namespace" {
  type = string
}

variable "argocd" {
  type = object({
    name = string
    version = string
  })
}