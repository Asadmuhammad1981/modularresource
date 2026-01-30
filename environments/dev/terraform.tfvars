rgs = {
  rg1 = {
    name       = "rg-asad-dev-01"
    location   = "centralindia"
    managed_by = "Terraform"
    tags = {
      env = "dev"
    }
  }
}

networks = {
  vnet1 = {
    name                = "vnet-asad-dev-01"
    location            = "centralindia"
    resource_group_name = "rg-asad-dev-01"
    address_space       = ["10.0.0.0/16"]
    tags = {
      environment = "dev"
    }
    subnets = [
      {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      },
      {
        name             = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      },
      {
        name             = "AzureBastionSubnet"
        address_prefixes = ["10.0.3.0/24"]
      }
    ]
  }
}


public_ips = {
  pip1 = {
    name                = "pip-dev-frontend-01"
    resource_group_name = "rg-asad-dev-01"
    location            = "centralindia"
    allocation_method   = "Static"
    tags = {
      app = "frontend"
      env = "dev"
    }
  }
  pip2 = {
    name                = "pip-dev-bastion-01"
    resource_group_name = "rg-asad-dev-01"
    location            = "centralindia"
    allocation_method   = "Static"
    tags = {
      app = "bastion"
      env = "dev"
    }
  }
  pip3 = {
    name                = "pip-dev-backend-01"
    resource_group_name = "rg-asad-dev-01"
    location            = "centralindia"
    allocation_method   = "Static"
    tags = {
      app = "backend"
      env = "dev"
    }
  }
}

key_vaults = {
  kv1 = {
    kv_name  = "kv-asad-dev-01"
    location = "centralindia"
    rg_name  = "rg-asad-dev-01"
  }
}

bastion = {
  name                = "bastion-asad-dev"
  location            = "centralindia"
  resource_group_name = "rg-asad-dev-01"
  subnet_name         = "AzureBastionSubnet"
  pip_name            = "pip-dev-bastion-01"
}

vms = {
  vm1 = {
    nic_name    = "nic-frontend-vm-01"
    location    = "centralindia"
    rg_name     = "rg-asad-dev-01"
    vnet_name   = "vnet-asad-dev-01"
    subnet_name = "frontend-subnet"
    pip_name    = "pip-dev-frontend-01"
    vm_name     = "frontend-vm"
    size        = "Standard_F2"
    kv_name     = "kv-asad-dev-01"
    username_secret_name = "vm-username-frontend"
    password_secret_name = "vm-password-frontend"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
      
    }
  }
  vm2 = {
    nic_name    = "nic-frontend-vm-02"
    location    = "centralindia"
    rg_name     = "rg-asad-dev-01"
    vnet_name   = "vnet-asad-dev-01"
    subnet_name = "backend-subnet"
    pip_name    = "pip-dev-backend-01"
    vm_name     = "backend-vm"
    kv_name = "kv-asad-dev-01"
    size        = "Standard_F2"
    username_secret_name = "vm-username-backend"
    password_secret_name = "vm-password-backend"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}
