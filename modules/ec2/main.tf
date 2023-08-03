resource "aws_instance" "ec2-public" {
  ami           = var.ec2-ami-id
  instance_type = var.ec2-instance-type
  key_name      = var.key-name

  vpc_security_group_ids      = [var.sg-public.id]
  subnet_id                   = var.subnet-public.id
  associate_public_ip_address = true

  user_data = file("user_data.sh")

  depends_on = [var.igw]

  tags = {
    Name = "ec2-public"
  }


  provisioner "file" {
    source      = "nginx-conf-files/"
    destination = "/home/ec2-user/"

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("${var.key-name}.pem")
      host        = aws_instance.ec2-public.public_ip
    }
  }

  provisioner "file" {
    source      = "scripts/"
    destination = "/home/ec2-user/"

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("${var.key-name}.pem")
      host        = aws_instance.ec2-public.public_ip
    }
  }
}
