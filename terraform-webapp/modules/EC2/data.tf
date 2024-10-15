
data "aws_ami" "amazon_linux" {
  filter {
    name   = "image-id"
    values = ["ami-0fff1b9a61dec8a5f"]  # Exact AMI ID provided
  }
  owners = ["amazon"]
}

data "aws_availability_zones" "availabile" {
    state ="available"
}
