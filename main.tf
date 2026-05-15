# 1. Tell Terraform which plugin (Provider) to download
terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "~> 0.4.0"
    }
  }
}

# 2. Initialize the Provider
provider "kind" {}

# 3. Define the actual Kubernetes cluster you want to build
resource "kind_cluster" "my_practice_cluster" {
  name           = "helm-learning-cluster"
  wait_for_ready = true

  # This section dictates the "hardware" shape of the cluster
  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    # The "Manager" server
    node {
      role = "control-plane"
    }

    # The "Worker" server
    node {
      role = "worker"
    }
  }
}

/*
provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "kind-terraform-learning-cluster"
}


#resource "kubernetes_manifest" "web_service" {
  #manifest   = yamldecode(file("${path.module}/web-service.yaml"))
  #depends_on = [kind_cluster.my_practice_cluster]
#}

#resource "kubernetes_manifest" "web_deployment" {
  #manifest   = yamldecode(file("${path.module}/web-deployment.yaml"))
  #depends_on = [kind_cluster.my_practice_cluster]
#}

#resource "kubernetes_manifest" "db_service" {
  #manifest   = yamldecode(file("${path.module}/db-service.yaml"))
  #depends_on = [kind_cluster.my_practice_cluster]
#}

#resource "kubernetes_manifest" "db_deployment" {
  #manifest   = yamldecode(file("${path.module}/db-deployment.yaml"))
  #depends_on = [kind_cluster.my_practice_cluster]
#}

#resource "kubernetes_manifest" "db_configmap" {
  #manifest   = yamldecode(file("${path.module}/db-cm0-configmap.yaml"))
  #depends_on = [kind_cluster.my_practice_cluster]
#}

*/