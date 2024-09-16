provider "aws" {
  region = "us-west-2"  # Change this to your desired region
}

resource "aws_instance" "example" {
  count = 2
  ami           = "ami-04b4d3355a2e2a403"  # Replace with your desired AMI ID
  instance_type = "t2.micro"                # Replace with your desired instance type
  key_name      = "west"       # Replace with your key pair name

  tags = {
    Name = "jenkins-instance"
  }
}



# resource "null_resource" "copy_private_key" {
#     provisioner "file" {
#     source      = "c:/users/Manikanta/Downloads/west.pem"  # Replace with the path to your local private key
#     destination = "/tmp/west.pem"           # Destination path on the remote instance
#   }
#     connection {
#       type        = "ssh"
#       user        = "ec2-user"  # Replace with the appropriate username for your AMI
#       private_key = "/tmp/west.pem"  # Replace with the path to your private key
#       host        = aws_instance.example.public_ip  # Update with your instance's public IP or DNS
#     }
    
#     depends_on = [aws_instance.example]
    
# }

# resource "null_resource" "install_httpd" {
#   provisioner "remote-exec" {
#     inline = [
#       "echo '${file("c:/users/Manikanta/Downloads/west.pem")}' > /tmp/private-key.pem",  # Replace with the absolute path to your local private key
#       "chmod 400 /tmp/private-key.pem",  # Ensure proper permissions
#       "sudo yum update -y",
#       "sudo yum install -y httpd",
#       "sudo systemctl start httpd",
#       "sudo systemctl enable httpd"
#     ]

#     connection {
#       type        = "ssh"
#       user        = "ec2-user"  # Replace with the appropriate username for your instance
#       private_key = file("c:/users/Manikanta/Downloads/west.pem")  # Replace with the absolute path to your local private key
#       host        = aws_instance.example.public_ip  # Update with your instance's public IP or DNS
#     }
#   }

#   depends_on = [aws_instance.example]
# }
