output "vcn_id" {
  value = oci_core_vcn.vcn.id
}

output "lb_public_subnet" {
  value = oci_core_subnet.lb_public_subnet.id
}

output "k8s_api_public_subnet" {
  value = oci_core_subnet.k8s_api_public_subnet.id
}

output "private_subnet_id" {
  value = oci_core_subnet.private_subnet.id
}
