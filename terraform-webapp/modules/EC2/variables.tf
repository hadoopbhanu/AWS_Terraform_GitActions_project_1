variable "sg_id" {
    description = "SG ID for Ec2"
    type = string
}

variable "subnets" {
    description = "subnets for the EC2 instance"
    type = list(string)
}

variable "EC2_names" {
    description = "Names for the Ec2 instance"
    type = list(string)
    default = ["web-server", "Database"]
}

