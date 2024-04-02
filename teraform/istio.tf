resource "helm_release" "istio" {
  name  = "redis"
  namespace = istio-system
  create_namespace = true
  chart = "https://charts.bitnami.com/bitnami/redis-10.7.16.tgz"

  set {
    name  = "dashboard.enabled"
    value = "true"
  }
}
