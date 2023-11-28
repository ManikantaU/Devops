provider "aws" {
  region = "us-west-2"  # Change this to your desired region
}

resource "aws_instance" "example" {
  ami           = "ami-093467ec28ae4fe03"  # Replace with your desired AMI ID
  instance_type = "t2.micro"                # Replace with your desired instance type
  key_name      = "west"       # Replace with your key pair name

  tags = {
    Name = "jenkins-instance"
  }
}
