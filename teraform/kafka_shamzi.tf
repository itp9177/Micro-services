
resource "helm_release" "strimzi-cluster-operator" {
  name  = "strimzi-cluster-operator"
  chart =  "./charts/strimzi-kafka-operator-0.40.0.tgz"
  
  set {
    name  = "replicas"
    value = "2"
  }
}

#kafka cluster 
resource "kubernetes_manifest" "kafkacluster" {


  manifest = yamldecode(file("./maifests/kafka/kafkacluster.yml"))
}