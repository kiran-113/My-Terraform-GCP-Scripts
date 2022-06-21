provider "google" {
  project     = var.project
  region      = "asia-south1"
  credentials = "fleet-anagram-350004-6ec1f736d69e.json"
}
resource "google_compute_address" "static" {
  project     = var.project
  name        = "ipv4-address-${count.index}"
  region      = "asia-south1"
  count       = 2
  
}

data "google_compute_image" "debian_image" {
  family  = "debian-9"
  project = "debian-cloud"
}

resource "google_compute_instance" "instance_with_ip" {
  project      = var.project
  zone         = "asia-south1-a"
  name         = "my-machine-${count.index}"
  machine_type = "f1-micro"
  tags         = ["http-server","https-server"]
  count        = 2
 
  boot_disk {
    initialize_params {
      image = data.google_compute_image.debian_image.self_link
    }
  }
   metadata_startup_script = file("scripts/install-www.sh")
 
  network_interface  {
    network = "default"
  
    access_config { }   
    
  }
}
 