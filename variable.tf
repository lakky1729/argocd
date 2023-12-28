variable "aws_region" {
  description = "The AWS region where the EC2 instance will be created."
  default     = "us-west-2"
}

variable "ami" {
  description = "The AMI ID for the EC2 instance."
  default     = "ami-08e2c1a8d17c2fe17"
  # Add your preferred AMI ID here
}

variable "instance_type" {
  description = "The type of EC2 instance to launch."
  default     = "t2.micro"
}
variable "key_name" {
  description = "The name of the key pair to associate with the EC2 instance."
  # Add your preferred key pair name here or leave it empty for user input
  default     = "argocd"
}

variable "key_pair_path" {
  description = "The path to the private key used to SSH into the EC2 instance."
  default     = "C:/Users/LENOVO/Desktop/argocd.pem"
  # Add the path to your private key here
}

variable "argocd_version" {
  description = "The version of ArgoCD to install."
  # Add your preferred ArgoCD version here
   default     = "2.1.2"
}
