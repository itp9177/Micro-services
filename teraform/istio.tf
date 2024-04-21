resource "helm_release" "istio-base" {
  name  = "istio-base"
  namespace = "istio-system"
  create_namespace = true
  chart = "./charts/base-1.21.0"

  set {
    name  = "defaultRevision"
    value = "default"
  }
}

resource "helm_release" "istiod" {
  name  = "istiod"
  namespace = "istio-system"
  create_namespace = true

  chart = "./charts/istiod-1.21.0.tgz"

}
#kiali for istio
resource "helm_release" "kiali-server" {
  name  = "kiali-server"
  namespace = "istio-system"
  create_namespace = true

  chart = "./charts/kiali-server-1.82.0.tgz"

  set {
    name  = "auth.strategy"
    value = "anonymous"
  }
}
