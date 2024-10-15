

variable  "vpc_cidr" {
    description = "CIDR range for the sillygully VPC"
    type = string
}

variable  "subnets_cidr"{
    description = "subnets CIDRS"
    type = list(string)

}

variable "subnet_names" {
    description = "Names for the subnets"
    type = list(string)
    default = ["silly_subnet_1", "silly_subnet_2"]
}