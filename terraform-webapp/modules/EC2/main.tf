
resource "aws_instance" "web-servers" {

    count = length(var.EC2_names)
    ami           = data.aws_ami.amazon_linux.image_id
    instance_type = "t3.micro"
    associate_public_ip_address = true
    vpc_security_group_ids = [var.sg_id]
    subnet_id = var.subnets[count.index]
    availability_zone = data.aws_availability_zones.availabile.names[count.index]
    # user_data = Used for startup scripts during the bootup.
    user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = var.EC2_names[count.index] 
    }
}