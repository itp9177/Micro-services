#create jekins pv volume
resource "kubernetes_manifest" "jenkins_volume" {
  provider = kubernetes-alpha

  manifest = yamldecode(file("./maifests/jenkins-volume.yml"))
}

#create jenkins service account
resource "kubernetes_manifest" "jenkins_serviceaccount" {
  provider = kubernetes-alpha

  manifest = yamldecode(file("./maifests/jenkins-service-account.yml"))
}

#create jenkins release
resource "helm_release" "jenkins" {
  name  = "jenkins"
  namespace = "jenkins"
  create_namespace = true
  chart =  "./charts/jenkins-5.1.5.tgz"

  values = [
    file("./maifests/jenkins-values.yaml")
  ]
}