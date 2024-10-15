
module "VPC" {
    source = "./modules/VPC"
    vpc_cidr = var.vpc_cidr
    subnets_cidr = var.subnets_cidr
}

module SG {
    source = "./modules/SG"
    vpc_id = module.VPC.vpc_id
}

module EC2 {
    source = "./modules/EC2"
    sg_id = module.SG.sg_id
    subnets = module.VPC.subnet_ids
}

module ALB {
    source = "./modules/ALB"
    sg_id = module.SG.sg_id
    subnets = module.VPC.subnet_ids
    vpc_id = module.VPC.vpc_id
    instances = module.EC2.instances
}