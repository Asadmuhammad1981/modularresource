variable "public_ips" {
  description = "Map of Public IP configurations"
  type                      = map(object({
    name                    = string
    resource_group_name     = string
    location                = string
    allocation_method       = string # Static / Dynamic
  }))
}
