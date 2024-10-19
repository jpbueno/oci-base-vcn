variable "compartment_ocid" {
  description = "Compartment OCID where the resources will be created."
  type        = string
}

variable "region" {
  description = "OCI Region."
  type        = string
}

variable "vcn_cidr" {
  description = "CIDR block for the VCN."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet."
  type        = string
  default     = "10.0.2.0/24"
}

variable "all_services_id" {
  description = "Service Gateway ID for all services in Ashburn"
  type = string
  default = "ocid1.service.oc1.iad.aaaaaaaam4zfmy2rjue6fmglumm3czgisxzrnvrwqeodtztg7hwa272mlfna"
}

variable "all_services_cidr" {
  description = "Service Gateway CIDR for all services in Ashburn"
  type = string
  default = "all-iad-services-in-oracle-services-network"
}