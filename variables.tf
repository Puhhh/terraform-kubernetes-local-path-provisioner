variable "kubeconfig-path" {
  description = "Kubeconfig Path"
  type        = string
  default     = "~/.kube/config"
}

variable "kube-context" {
  description = "Kubernetes Context to Use"
  type        = string
  default     = ""
}

variable "local-path-provisioner-namespace" {
  description = "Local Path Provisioner Namespace"
  type        = string
  default     = "local-path-provisioner"
}

variable "namespace-labels" {
  description = "Namespace Labels"
  type        = map(string)
  default = {
    "pod-security.kubernetes.io/enforce" = "privileged"
  }
}

variable "helm-name" {
  description = "Helm Release Name"
  type        = string
  default     = "local-path-provisioner"
}

variable "helm-chart-name" {
  description = "Helm Chart Name"
  type        = string
  default     = "local-path-provisioner"
}

variable "helm-chart-repo" {
  description = "Helm Chart Repo"
  type        = string
  default     = "https://puhhh.github.io/pages-helm-repo/"
}

variable "helm-chart-version" {
  description = "Helm Chart Version"
  type        = string
  default     = "0.0.28"
}

variable "helm-custom-values" {
  description = "Use Helm Custom Values"
  type        = bool
  default     = false
}

variable "helm-custom-values-path" {
  description = "Helm Custom Values Path"
  type        = string
  default     = ""

  validation {
    condition     = !(var.helm-custom-values && var.helm-custom-values-path == "")
    error_message = "helm-custom-values-path must not be null when helm-custom-values is true."
  }
}
