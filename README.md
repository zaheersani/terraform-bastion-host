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
git clone https://github.com/zaheersani/terraform-bastion-host.git
cd terraform-bastion-host
```

### 2. Configure Variables
Update the ```variables.tf``` for:

```aws_region:``` AWS region to deploy resources in

```vpc_id:``` ID of the existing VPC

```public_subnet_id:``` ID of the public subnet for the bastion host

```ami_id:``` AMI ID for the EC2 instance - Default: Ubuntu Server 20.04 LTS

```instance_type:``` Instance type for the bastion host - Default: t2.micro

```allowed_ssh_cidr:``` CIDR blocks allowed for SSH access - Default: Allow All Traffic

```ssh_public_key:``` Public key for SSH access

### 3. Initialize Terraform
Run the following command to download provider plugins:
```
terraform init
```

### 4. Plan Infrastructure
Preview the changes Terraform will make:
```
terraform plan
```

### 5. Apply Configuration
Deploy the infrastructure:
```
terraform apply
```

Public IP will output on console upon successful provisioning of resources. This IP can be used to connect to the instance using SSH

### 6. Access the Bastion Host
Once the deployment is complete, use the outputted public IP to connect to the bastion host:
```
ssh -i path_to_private_key ec2-user@<bastion_public_ip>
```
