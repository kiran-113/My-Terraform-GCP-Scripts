provider "google" {
  project     = var.project
  region      = "us-west1"
  credentials = "prod-350509-d3fe23141246.json"
}

data "google_compute_image" "debian_image" {
  family  = "debian-9"
  project = "debian-cloud"
}

resource "google_compute_instance" "instance_with_ip" {
  project      = var.project
  zone         = "us-west1-a"
  name         = "my-machine-${count.index}"
  machine_type = "f1-micro"
  tags         = ["http-server","https-server"]
  count        = 1
 
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
 