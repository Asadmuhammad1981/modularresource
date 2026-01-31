variable "bastion" {
    type = map(object({
        name                 = string
        location             = string
        resource_group_name  = string
        bastion_subnet_id    = string
        bastion_pip_id       = string
    }))
}