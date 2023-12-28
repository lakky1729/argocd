provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "argocd_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "argocd-instance"
  }

  // Provisioner block for remote execution
  provisioner "remote-exec" {
    inline = [
      "sudo mkdir -p /usr/local/bin",
    "sudo curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/v${var.argocd_version}/argocd-linux-amd64 > /tmp/argocd_download.log 2>&1",
    "sudo chmod +x /usr/local/bin/argocd",
      # Add any additional installation steps here
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.key_pair_path)
      host        = self.public_ip
    }
  }
}

# Outputs block can be added as needed
