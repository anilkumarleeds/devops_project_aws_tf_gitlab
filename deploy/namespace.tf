resource "kubernetes_manifest" "namespace_allvy" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Namespace"
    "metadata" = {
      "labels" = {
        "kubernetes.io/metadata.name" = "dev"
      }
      "name" = "dev"
    }
    "spec" = {}
  }
}