resource "aws_security_group" "project_sg" {
    name        = "Project-SG"
    description = "Open 22,443,80,8080,9000"

    ingress = [
        for port in [22, 80, 443, 8080, 9000, 3000] : {
        description      = "Allow traffic on port ${port}"
        from_port        = port
        to_port          = port
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = []
        prefix_list_ids  = []
        security_groups  = []
        self             = false
        }
    ]

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "Project-SG"
    }
}

