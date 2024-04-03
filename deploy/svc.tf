resource "kubernetes_manifest" "service_allvy_user_charges" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "annotations" = {
        "service.beta.kubernetes.io/aws-load-balancer-backend-protocol" = "http"
      }
      "labels" = {
        "app" = "uiapp"
        "group" = "uiapp"
      }
      "name" = "uiapp"
      "namespace" = "allvy"
    }
    "spec" = {
      "allocateLoadBalancerNodePorts" = true
      "externalTrafficPolicy" = "Cluster"
      "internalTrafficPolicy" = "Cluster"
      "ipFamilies" = [
        "IPv4",
      ]
      "ipFamilyPolicy" = "SingleStack"
      "ports" = [
        {
          "name" = "http"
          "nodePort" = 30881
          "port" = 80
          "protocol" = "TCP"
          "targetPort" = 80
        },
        {
          "name" = "https"
          "nodePort" = 32375
          "port" = 443
          "protocol" = "TCP"
          "targetPort" = 80
        },
      ]
      "selector" = {
        "app" = "uiapp"
        "group" = "uiapp"
      }
      "sessionAffinity" = "None"
      "type" = "LoadBalancer"
    }
  }
}
