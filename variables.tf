variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "ID of the existing VPC"
  type        = string
# default     = "vpc-09fed0b03bc722db7"
}

variable "public_subnet_id" {
  description = "ID of the public subnet for the bastion host"
  type        = string
# default     = "subnet-0b579887bf5efe358"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance - Ubuntu Server 20.04 LTS"
  type        = string
  default     = "ami-0866a3c8686eaeeba"
}

variable "instance_type" {
  description = "Instance type for the bastion host"
  type        = string
  default     = "t2.micro"
}

variable "allowed_ssh_cidr" {
  description = "CIDR blocks allowed for SSH access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ssh_public_key" {
  description = "Public key for SSH access"
  type        = string
}
