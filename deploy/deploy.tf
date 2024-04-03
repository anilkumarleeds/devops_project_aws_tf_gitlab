resource "kubernetes_manifest" "deployment_uiapp" {
  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "annotations" = {
        "deployment.kubernetes.io/revision" = "1"
      }
      "labels" = {
        "app" = "uiapp"
        "group" = "uiapp"
      }
      "name" = "uiapp"
      "namespace" = "dev"
    }
    "spec" = {
      "progressDeadlineSeconds" = 600
      "replicas" = 3
      "revisionHistoryLimit" = 10
      "selector" = {
        "matchLabels" = {
          "app" = "uiapp"
          "group" = "uiapp"
        }
      }
      "strategy" = {
        "rollingUpdate" = {
          "maxSurge" = 1
          "maxUnavailable" = 1
        }
        "type" = "RollingUpdate"
      }
      "template" = {
        "metadata" = {
          "creationTimestamp" = null
          "labels" = {
            "app" = "uiapp"
            "group" = "uiapp"
          }
        }
        "spec" = {
          "containers" = [
            {
              "env" = [
                {
                  "name" = "SERVER_PORT"
                  "valueFrom" = {
                    "configMapKeyRef" = {
                      "key" = "SERVER_PORT"
                      "name" = "ui-dev"
                    }
                  }
                },
                
              ]
              "image" = "allvy/uiapp-436:7e1879c9"
              "imagePullPolicy" = "IfNotPresent"
              "name" = "uiapp"
              "ports" = [
                {
                  "containerPort" = 80
                  "protocol" = "TCP"
                },
              ]
              "resources" = {
                "limits" = {
                  "memory" = "512Mi"
                }
                "requests" = {
                  "memory" = "128Mi"
                }
              }
              "terminationMessagePath" = "/dev/termination-log"
              "terminationMessagePolicy" = "File"
            },
          ]
          "dnsPolicy" = "ClusterFirst"
          "imagePullSecrets" = [
            {
              "name" = "regsecret"
            },
            {
              "name" = "allvyregsecret"
            },
          ]
          "restartPolicy" = "Always"
          "schedulerName" = "default-scheduler"
          "securityContext" = {}
          "terminationGracePeriodSeconds" = 30
        
        }
      }
    }
  }
}
