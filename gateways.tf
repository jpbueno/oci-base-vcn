resource "oci_core_internet_gateway" "internet_gateway" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "dev-internet-gateway"
  enabled        = true
}

resource "oci_core_nat_gateway" "nat_gateway" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "dev-nat-gateway"
}

resource "oci_core_service_gateway" "service_gateway" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name = "dev-service-gateway"
  services {
    service_id = var.all_services_id
  }
}

resource "oci_core_route_table" "public_route_table" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "public-route-table"

  route_rules {
    destination        = "0.0.0.0/0"
    network_entity_id  = oci_core_internet_gateway.internet_gateway.id
  }
}

resource "oci_core_route_table" "private_route_table" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "private-route-table"

  route_rules {
    destination        = "0.0.0.0/0"
    network_entity_id  = oci_core_nat_gateway.nat_gateway.id
  }
  route_rules {
    destination_type = "SERVICE_CIDR_BLOCK"
    destination = var.all_services_cidr
    network_entity_id = oci_core_service_gateway.service_gateway.id
  }
}
