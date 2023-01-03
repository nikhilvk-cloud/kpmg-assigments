

locals {
  project-id = "psychic-lens-351807"
  primary_region = "us-central1"
  network = "projects/${local.project-id}/global/network/default"
  subnet = "projects/psychic-lens-351807/regions/us-central1/subnetworks/default"
}

terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
}