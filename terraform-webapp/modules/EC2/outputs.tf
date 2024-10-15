
output "instances" {
    value = aws_instance.web-servers.*.id
}