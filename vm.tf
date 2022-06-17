# Create Google Cloud VMs | vm.tf
# Create web server #1
resource "google_compute_instance" "web_private_1" {
  name = "${var.app_name}-vm1"
  machine_type = "f1-micro"
  zone = var.gcp_zone_1
  hostname = "${var.app_name}-vm1.${var.app_domain}"
  tags = ["ssh","http"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -y apache2"
  network_interface {
    network = google_compute_network.vpc.name
    subnetwork = google_compute_subnetwork.private_subnet_1.name
  }
}
# Create web server #2
resource "google_compute_instance" "web_private_2" {
  name = "${var.app_name}-vm2"
  machine_type = "f1-micro"
  zone = var.gcp_zone_1
  hostname = "${var.app_name}-vm2.${var.app_domain}"
  tags = ["ssh","http"]
boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -y apache2"
network_interface {
    network = google_compute_network.vpc.name
    subnetwork = google_compute_subnetwork.private_subnet_1.name
  }
}
