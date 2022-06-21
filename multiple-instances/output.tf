output "google_compute_instance_name" {
  
  value= "${join(" , ", google_compute_instance.instance_with_ip.*.name)}"
}


output "google_compute_instance_IP" {
  
   value= "${join(" , ", google_compute_instance.instance_with_ip.*.network_interface.0.access_config.0.nat_ip)}"
}




  





#output "Instances_Public_IP_Addresses"{
  
  #  value = [google_compute_instance.instance_with_ip.*.network_interface.0.access_config.0.nat_ip]
#}

#output "name" {
 #   value = [google_compute_instance.instance_with_ip.*.name.name]
  #google_compute_instance.

  #"google_compute_instance" "instance_with_ip" {
  #name         = "my-machine-${count.index}"

#}

