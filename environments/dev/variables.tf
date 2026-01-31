variable "rgs" {
  type = map(object({
    name       = string
    location   = string
    managed_by = string
    tags       = map(string)
  }))
}

variable "vnet" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = map(string)
  }))
}

variable "subnets" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "public_ips" {
  description = "Map of Public IP configurations"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string # Static / Dynamic
  }))
}

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
      username_secret_name   = string
      password_secret_name   = string
      source_image_reference = map(string)
    }
  ))
}

variable "bastion" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    bastion_subnet_id   = string
    bastion_pip_id      = string
  }))
}