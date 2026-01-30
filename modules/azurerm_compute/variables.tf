variable "vms" {
  type = map(object({
    nic_name               = string
    location               = string
    rg_name                = string
    vnet_name              = string
    subnet_name            = string
    pip_name               = string
    vm_name                = string
    size                   = string
    # Change these to optional
    admin_username         = optional(string)
    admin_password         = optional(string)
    # Add these since they were in your tfvars but missing here
    kv_name                = optional(string)
    username_secret_name   = optional(string)
    password_secret_name   = optional(string)
    source_image_reference = map(string)
  }))
}

