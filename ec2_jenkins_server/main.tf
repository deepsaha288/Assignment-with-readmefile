resource "aws_instance" "ec2_instance" {
    ami                    = var.ami_id
    instance_type          = var.instance_type
    key_name               = var.key_name
    vpc_security_group_ids = [aws_security_group.project_sg.id]
    user_data              = templatefile("./install_software.sh", {})

    tags = {
        Name = "Jenkins-server"
    }

    root_block_device {
        volume_size = 30
    }
}
