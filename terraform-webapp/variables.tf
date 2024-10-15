variable  "vpc_cidr" {
    description = "CIDR range for the sillygully VPC"
    type = string
}


variable  "subnets_cidr" {
    description = "subnets CIDRS list"
    type = list(string)

}