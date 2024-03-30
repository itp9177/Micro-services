provider "kubernetes" {
  config_path    = "/home/indu/.kube/config"
  config_context = "minikube"
}
resource "kubernetes_namespace" "example" {
  metadata {
    name = "my-first-namespace"
  }
}

