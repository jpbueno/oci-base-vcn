resource "oci_core_vcn" "vcn" {
  cidr_block     = var.vcn_cidr
  compartment_id = var.compartment_ocid
  display_name   = "dev-vcn"
  dns_label      = "devvcn"
}

resource "oci_core_subnet" "lb_public_subnet" {
  cidr_block              = var.lb_public_subnet_cidr
  compartment_id          = var.compartment_ocid
  vcn_id                  = oci_core_vcn.vcn.id
  display_name            = "lb_public-subnet"
  prohibit_public_ip_on_vnic = false
  route_table_id          = oci_core_route_table.public_route_table.id
  dns_label               = "devlbpub"
}

resource "oci_core_subnet" "k8s_api_public_subnet" {
  cidr_block              = var.k8s_api_public_subnet_cidr
  compartment_id          = var.compartment_ocid
  vcn_id                  = oci_core_vcn.vcn.id
  display_name            = "k8s_api_public-subnet"
  prohibit_public_ip_on_vnic = false
  route_table_id          = oci_core_route_table.public_route_table.id
  dns_label               = "devapipub"
}

resource "oci_core_subnet" "private_subnet" {
  cidr_block              = var.private_subnet_cidr
  compartment_id          = var.compartment_ocid
  vcn_id                  = oci_core_vcn.vcn.id
  display_name            = "private-subnet"
  prohibit_public_ip_on_vnic = true
  route_table_id          = oci_core_route_table.private_route_table.id
  dns_label               = "devpriv"
}
