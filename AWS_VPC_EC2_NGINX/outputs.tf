output "instance_public_ip" {

  description = "The Public ip address of EC2 Instance"
  value       = aws_instance.myinst.public_ip
}

output "instance_url" {
  description = "The URL to access the Nginx server"
  value       = "http://${aws_instance.myinst.public_ip}"
}