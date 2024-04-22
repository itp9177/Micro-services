#create namespace
resource "kubernetes_namespace" "ingress-apisix" {
  metadata {
    name = "ingress-apisix"
    labels = {
      istio-injection = "enabled"
    }
  }
}
#apisix ingres
resource "helm_release" "apisix" {
  name  = "apisix"
  namespace = "ingress-apisix"
  chart = "./charts/apisix-2.6.0.tgz"

  set {
    name  = "service.type"
    value = "NodePort"
  }

  set {
    name  = "ingress-controller.enabled"
    value = "true"
  }

  set {
    name  = "ingress-controller.config.apisix.serviceNamespace"
    value = "ingress-apisix"
  }

  set {
    name  = "ingress-controller.config.apisix.adminAPIVersion"
    value = "v3"
  }
  
}

#add the dashboard

resource "helm_release" "apisix-dashboard" {
  name      = "apisix-dashboard"
  namespace = "ingress-apisix"
  create_namespace = "true"
  chart     = "./charts/apisix-dashboard-0.8.2.tgz"
  
}