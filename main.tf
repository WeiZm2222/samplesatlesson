terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  # Edit below, this is to authenticate our user ID for aws, do not push hardcoded access and secret keys to git 
  access_key = secrets.AWS_ACCESS_KEY_ID
  secret_key = secrets.AWS_SECRET_ACCESS_KEY
}

resource "aws_instance" "instances"  {  #this is just gonna be a name for terraform to recognise
  ami           = "ami-0f34c5ae932e6f0e4"  # Amazon Linux 2023 AMI
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id = ""
  vpc_security_group_ids = ["sg-037dc039bc9aae49d"] #the .id Points to sec group id, else can also use exisiting security group in AWS console
  key_name = "zm-test1" #for SSH connection, created below
 
  tags = {
    Name = "zmwCoachingWebserver"
  }
}
