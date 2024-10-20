resource "oci_core_vcn" "vcn" {
  cidr_block     = var.vcn_cidr
  compartment_id = var.compartment_ocid
  display_name   = "dev-vcn"
  dns_label      = "devvcn"
}

resource "oci_core_subnet" "public_subnet" {
  cidr_block              = var.public_subnet_cidr
  compartment_id          = var.compartment_ocid
  vcn_id                  = oci_core_vcn.vcn.id
  display_name            = "public-subnet"
  prohibit_public_ip_on_vnic = false
  route_table_id          = oci_core_route_table.public_route_table.id
  dns_label               = "pubsub"
}

resource "oci_core_subnet" "private_subnet" {
  cidr_block              = var.private_subnet_cidr
  compartment_id          = var.compartment_ocid
  vcn_id                  = oci_core_vcn.vcn.id
  display_name            = "private-subnet"
  prohibit_public_ip_on_vnic = true
  route_table_id          = oci_core_route_table.private_route_table.id
  dns_label               = "privsub"
}
