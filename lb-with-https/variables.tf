# define the GCP authentication file
variable "gcp_auth_file" {
  default = "fleet-anagram-350004-6ec1f736d69e.json"
  description = "GCP authentication file"
}
# define GCP project name
variable "project_id" {
  default     = "fleet-anagram-350004"
  description = "GCP project name"
}
# define GCP region
variable "gcp_region_1" {
  type = string
  description = "GCP region"
}
# define GCP zone
variable "gcp_zone_1" {
  type = string
  description = "GCP zone"
}
# define private subnet
variable "private_subnet_cidr_1" {
  type = string
  description = "private subnet CIDR 1"
}
variable "app_name" {
   default = "one"
}

variable  "app_domain" {
    default ="two"
}
  
