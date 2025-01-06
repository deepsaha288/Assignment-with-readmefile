output "instance_id" {
    description = "The ID of the EC2 instance"
    value       = aws_instance.web.id
}

output "instance_public_ip" {
    description = "The public IP of the EC2 instance"
    value       = aws_instance.web.public_ip
}

output "security_group_id" {
    description = "The ID of the Security Group"
    value       = aws_security_group.project_sg.id
}

output "security_group_name" {
    description = "The name of the Security Group"
    value       = aws_security_group.project_sg.name
}
