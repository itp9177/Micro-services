resource "helm_release" "apisix" {
  name  = "apisix"
  namespace = "apisix"
  create_namespace = true
  chart = "./apisix-2.6.0.tgz"

  set {
    name  = "dashboard.enabled"
    value = "true"
  }
  set {
    name  = "ingress-controller.enabled"
    value = "true"
  }
  set {
    name  = "ingress-controller.config.apisix.serviceNamespace"
    value = "apisix"
  }
}