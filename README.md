# OCI Base VCN

A foundational Oracle Cloud Infrastructure (OCI) Virtual Cloud Network (VCN) setup, designed for environments requiring both public and private regional subnets. This configuration includes all necessary gateways and security lists with predefined rules, making it ready for Oracle Kubernetes Engine (OKE) deployment.

## Features

- **Public and Private Subnets**: Supports both public and private workloads with separate subnets for enhanced security and control.
- **Gateways**:
  - **Internet Gateway**: Enables public subnet access to the internet.
  - **NAT Gateway**: Provides private subnet access to the internet for outbound communication.
  - **Service Gateway**: Allows private subnet communication with OCI services without exposing resources to the public internet.
- **Security Lists**: Preconfigured security rules tailored for OKE, with recommended ingress and egress controls.

## Usage

Clone this repository and apply the configuration using Terraform. Customize the variables as needed to suit your specific OCI environment.

```bash
git clone https://github.com/yourusername/oci-base-vcn.git
cd oci-base-vcn
terraform init
terraform apply
