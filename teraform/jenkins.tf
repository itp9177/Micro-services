#create storageclass
resource "kubernetes_manifest" "jenkins_storageclass" {
  provider = kubernetes-alpha

  manifest = yamldecode(file("./maifests/jenkins/StorageClass.yml"))
}
#create jekins pv volume
resource "kubernetes_manifest" "jenkins_volume" {
  provider = kubernetes-alpha

  manifest = yamldecode(file("./maifests/jenkins/pvvolume.yml"))
}

#create jenkins service account
resource "kubernetes_manifest" "jenkins_serviceaccount" {
  provider = kubernetes-alpha

  manifest = yamldecode(file("./maifests/jenkins/serviceaccount.yml"))
}

#create jenkins service account
resource "kubernetes_manifest" "jenkins_rolebinding" {
  provider = kubernetes-alpha

  manifest = yamldecode(file("./maifests/jenkins/rolebinding.yml"))
}

#create jenkins clusterrole
resource "kubernetes_manifest" "jenkins_clusterrole" {
  provider = kubernetes-alpha

  manifest = yamldecode(file("./maifests/jenkins/clusterrole.yml"))
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