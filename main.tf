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