# Terraform Configuration for Bastion Host

This repository contains a Terraform configuration to deploy a bastion host in AWS. A bastion host is an EC2 instance designed to securely manage access to resources in private subnets. This project dynamically creates the required resources and outputs the bastion host's public IP for SSH access.

---

## Features

- Creates an EC2 instance configured as a bastion host in a public subnet.
- Dynamically provisions a security group with SSH access restricted to specified IP ranges.
- Supports flexible inputs for AMI ID, instance type, and network configurations.
- Outputs the public IP address of the bastion host for SSH access.

---

## Prerequisites

To use this project, ensure you have the following:
- An AWS account.
- An existing VPC with at least one public subnet.
- [Terraform installed](https://developer.hashicorp.com/terraform/tutorials).
- [AWS CLI installed](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) and configured with valid credentials.
- A valid AWS key pair for SSH access (downloaded private key).

---

## Usage

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/terraform-bastion-host.git
cd terraform-bastion-host
