provider "helm" {
  kubernetes {
    config_path = "/home/indu/.kube/config"
  }
}
resource "helm_release" "redis" {
  name  = "redis"
  chart = "https://charts.bitnami.com/bitnami/redis-10.7.16.tgz"
}


resource "helm_release" "example" {
  name  = "redis"
  chart = "https://charts.bitnami.com/bitnami/redis-10.7.16.tgz"
}