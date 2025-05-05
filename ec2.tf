resource "aws_instance" "nginx_server" {
  ami                    = "ami-0c02fb55956c7d316"  # Amazon Linux 2 (ajusta según la región)
  instance_type          = var.instance_type
  key_name               = aws_key_pair.hotel_project.key_name  # apunta al recurso en key.tf
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "HotelNginxServer"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install nginx1 -y
              systemctl start nginx
              systemctl enable nginx
              EOF

              #Conecta la llave a este recurso 
  
}
