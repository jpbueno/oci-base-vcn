resource oci_core_security_list k8s_api_security_list {
  compartment_id = var.compartment_ocid
  display_name   = "k8s_api_security_list"

  egress_security_rules {
    description      = "Allow all egress traffic"
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol         = "all"
    stateless        = "false"
  }

  ingress_security_rules {
    description = "External access to Kubernetes API endpoint"
    protocol    = "6" # TCP
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "6443"
      min = "6443"
    }
  }

  ingress_security_rules {
    description = "Allow all traffic from 10.0.0.0/16"
    protocol    = "all"
    source      = "10.0.0.0/16"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
  }

  vcn_id = oci_core_vcn.dev-vcn.id
}

resource oci_core_security_list private_security_list {
  compartment_id = var.compartment_ocid
  display_name   = "private_security_list"

  egress_security_rules {
    description      = "Allow all egress traffic"
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol         = "all"
    stateless        = "false"
  }

  ingress_security_rules {
    description = "Allow all traffic from 10.0.0.0/16"
    protocol    = "all"
    source      = "10.0.0.0/16"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
  }

  vcn_id = oci_core_vcn.dev-vcn.id
}

resource oci_core_security_list lb_security_list {
  compartment_id = var.compartment_ocid
  display_name   = "lb_security_list"

  egress_security_rules {
    description      = "Allow all egress traffic"
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol         = "all"
    stateless        = "false"
  }

  ingress_security_rules {
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "9003"
      min = "9003"
    }
  }

  ingress_security_rules {
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "9090"
      min = "9090"
    }
  }

  ingress_security_rules {
    description = "Allow HTTP traffic from anywhere"
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "80"
      min = "80"
    }
  }

  ingress_security_rules {
    description = "Allow all traffic from 10.0.0.0/16"
    protocol    = "all"
    source      = "10.0.0.0/16"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
  }

  vcn_id = oci_core_vcn.dev-vcn.id
}