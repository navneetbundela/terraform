output "inst_ip" {

  value = aws_instance.myinstance[*].public_ip

}