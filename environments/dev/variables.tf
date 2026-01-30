variable "rgs" {
  type = map(object({
    name       = string
    location   = string
    managed_by = string
    tags       = map(string)
  }))
}

variable "networks" {
  type = map(object({
    # ... other fields
    address_space = list(string) # Must be list(string)
    subnets = list(object({
      name             = string
      address_prefixes = list(string) # Must be list(string)
    }))
  }))
}

variable "public_ips" {}
variable "key_vaults" {

}

variable "vms" {
  type = map(object(
    {
      nic_name               = string
      location               = string
      rg_name                = string
      vnet_name              = string
      subnet_name            = string
      pip_name               = string
      vm_name                = string
      kv_name                = string
      size                   = string
    username_secret_name     = string
    password_secret_name     = string
      source_image_reference = map(string)
    }
  ))
}
variable "bastion" {}
