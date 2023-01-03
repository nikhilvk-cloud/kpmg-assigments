module "cloud_router_nat" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "3.0.0"
  name    = "cloud-router-nat"
  project = local.project-id
  region  = local.primary_region
  network = local.network
}