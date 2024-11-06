resource "oci_core_security_list" "public_security_list" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "public-security-list"

  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"
    tcp_options {
      min = 22
      max = 22
    }
  }

  # Allow Kubernetes API Server port (6443) ingress rule
  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"
    tcp_options {
      min = 6443
      max = 6443
    }
    description = "Allow access to Kubernetes API server"
  }

  # Allow NodePort services ingress rule (30000-32767)
  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"
    tcp_options {
      min = 30000
      max = 32767
    }
    description = "Allow access to Kubernetes NodePort services"
  }

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}

resource "oci_core_security_list" "private_security_list" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "private-security-list"

  # Allow all traffic from within the VCN
  ingress_security_rules {
    protocol = "all"
    source   = oci_core_vcn.vcn.cidr_block
  }

  # Allow kubelet communication (port 10250)
  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"
    tcp_options {
      min = 10250
      max = 10250
    }
    description = "Allow kubelet communication"
  }
  
  # Allow egress to Oracle services via Service Gateway (use correct CIDR or predefined range)
  egress_security_rules {
    protocol    = "all"
    destination = "169.254.0.0/16" # CIDR range for Oracle services (service gateway)
    description = "Allow access to Oracle services via Service Gateway"
  }

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}
