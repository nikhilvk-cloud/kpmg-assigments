resource "google_compute_instance" "frontend" {
  
  name = "frontend"
  zone = "us-central1-a"
  machine_type = "n1-standard-4"
  project = "psychic-lens-351807"
  allow_stopping_for_update = true
  boot_disk {
   initialize_params {
      size = 50
      image  = "ubuntu-2004-focal-v20220308"
   }   
  }
  service_account {
      email = "595042382486-compute@developer.gserviceaccount.com"
      scopes = [ "cloud-platform" ]
  }
  
  network_interface {
    subnetwork = local.subnet
    subnetwork_project = "psychic-lens-351807"    
  }
  metadata = {
    enable-oslogin = true
    block-project-ssh-keys = true
  }
  shielded_instance_config {
    enable_secure_boot = true
  }
}

resource "google_compute_instance_group" "webservers" {
  name        = "terraform-webservers"
  description = "Terraform test instance group"
  project = local.project-id
  instances = [
    google_compute_instance.frontend.id,
  ]

  named_port {
    name = "http"
    port = "80"
  }
  zone = "us-central1-a"
}