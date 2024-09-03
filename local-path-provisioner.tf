resource "kubernetes_namespace" "local-path-provisioner-namespace" {
  metadata {
    name   = var.local-path-provisioner-namespace
    labels = var.namespace-labels
  }
}

resource "helm_release" "local-path-provisioner" {
  namespace  = kubernetes_namespace.local-path-provisioner-namespace.metadata[0].name
  name       = var.helm-name
  chart      = var.helm-chart-name
  repository = var.helm-chart-repo
  version    = var.helm-chart-version

  values = var.helm-custom-values ? [file(var.helm-custom-values-path)] : []
}
