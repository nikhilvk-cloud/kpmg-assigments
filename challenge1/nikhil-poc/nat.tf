module "cloud_nat" {
  source                              = "terraform-google-modules/cloud-nat/google"
  name                                = "poc-nik"
  project_id                          = local.project-id
  region                              = local.primary_region
  router                              = module.cloud_router_nat.router.name
  min_ports_per_vm                    = local.min_ports_per_vm
  source_subnetwork_ip_ranges_to_nat  = local.source_subnetwork_ip_ranges_to_nat
  enable_endpoint_independent_mapping = false
}



locals {
  min_ports_per_vm = 128
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}