output "App_URL" {
    value = "http://${aws_instance.webserver.public_ip}"
    description = "The URL of the new ec2 web server"
}