
#Output for for_each loop.
output "instance_ip" {

  value = [
    for key in aws_instance.myinstance : key.public_ip
  ]

}