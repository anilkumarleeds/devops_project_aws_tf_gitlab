resource "kubernetes_manifest" "configmap_uc_dev" {
  manifest = {
    "apiVersion" = "v1"
    "data" = {
      "SERVER_PORT" = "9999"
    }
    "kind" = "ConfigMap"
    "metadata" = {
      "name" = "ui-dev"
      "namespace" = "dev"
    }
  }
}
