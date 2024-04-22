
resource "helm_release" "strimzi-cluster-operator" {
  name  = "strimzi-cluster-operator"
  chart =  "./charts/strimzi-kafka-operator-0.40.0.tgz"
  
  set {
    name  = "replicas"
    value = "2"
  }
}

#kafka cluster 
resource "helm_release" "kafka-cluster" {
  name  = "kafka-cluster"
  chart =  "./charts/kafka-operator-0.10.tgz"
  
  depends_on=[helm_release.strimzi-cluster-operator]
}