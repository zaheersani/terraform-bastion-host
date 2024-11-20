# Define the provider
provider "aws" {
  region = var.aws_region
}

# Security group for the bastion host
resource "aws_security_group" "bastion_sg" {
  name_prefix = "bastion-sg-" # Unique name with a prefix
  description = "Allow SSH access for bastion host"
  vpc_id      = var.vpc_id

  # Inbound rule for SSH access - Only SSH is allowed
  ingress {
    description = "Allow SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidr
  }

  # Outbound rule to allow all traffic
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Bastion Security Group"
  }
}

# Key pair for SSH access
resource "aws_key_pair" "bastion_key" {
  key_name   = "bastion-key"
  public_key = var.ssh_public_key
}

# EC2 instance for the bastion host
resource "aws_instance" "bastion" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.bastion_key.key_name

  # Associate the security group with the instance
  vpc_security_group_ids = [
    aws_security_group.bastion_sg.id
  ]

  # Associate the instance with the public subnet
  subnet_id     = var.public_subnet_id

  # Associate a public IP address with the instance
  associate_public_ip_address = true

  tags = {
    Name = "Bastion Host"
  }
}

# Output the public IP of the bastion host after provisioning
output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}
