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

vnet = {
  vnet1 = {
  name                = "vnet-asad-dev-01"
  location            = "centralindia"
  resource_group_name = "rg-asad-dev-01"
  address_space       = ["10.0.0.0/16"]
  tags                = { environment = "dev" }
}
}

subnets = {
  subnet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "rg-asad-dev-01"
    virtual_network_name = "vnet-asad-dev-01"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "rg-asad-dev-01"
    virtual_network_name = "vnet-asad-dev-01"
    address_prefixes     = ["10.0.2.0/24"]
  }
  subnet3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rg-asad-dev-01"
    virtual_network_name = "vnet-asad-dev-01"
    address_prefixes     = ["10.0.3.0/24"]
  }
}


public_ips = {
  pip1 = {
    name                = "pip-dev-frontend-01"
    resource_group_name = "rg-asad-dev-01"
    location            = "centralindia"
    allocation_method   = "Static"
    # tags = {
    #   app = "frontend"
    #   env = "dev"
    # }
  }
  pip2 = {
    name                = "pip-dev-bastion-01"
    resource_group_name = "rg-asad-dev-01"
    location            = "centralindia"
    allocation_method   = "Static"
    # tags = {
    #   app = "bastion"
    #   env = "dev"
    # }
  }
  pip3 = {
    name                = "pip-dev-backend-01"
    resource_group_name = "rg-asad-dev-01"
    location            = "centralindia"
    allocation_method   = "Static"
    # tags = {
    #   app = "backend"
    #   env = "dev"
    # }
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
 bastion1 = {
    name                = "bastion-asad-dev"
    location            = "centralindia"
    resource_group_name = "rg-asad-dev-01"
    bastion_subnet_id   = "/subscriptions/11f3bb77-47df-4c33-a394-95f276773f1e/resourceGroups/rg-asad-dev-01/providers/Microsoft.Network/virtualNetworks/vnet-asad-dev-01/subnets/AzureBastionSubnet"
    bastion_pip_id      = "/subscriptions/11f3bb77-47df-4c33-a394-95f276773f1e/resourceGroups/rg-asad-dev-01/providers/Microsoft.Network/publicIPAddresses/pip-dev-bastion-01"
 }
}

vms = {
  vm1 = {
    nic_name             = "nic-frontend-vm-01"
    location             = "centralindia"
    rg_name              = "rg-asad-dev-01"
    vnet_name            = "vnet-asad-dev-01"
    subnet_name          = "frontend-subnet"
    pip_name             = "pip-dev-frontend-01"
    vm_name              = "frontend-vm"
    size                 = "Standard_F2"
    kv_name              = "kv-asad-dev-01"
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
    nic_name             = "nic-frontend-vm-02"
    location             = "centralindia"
    rg_name              = "rg-asad-dev-01"
    vnet_name            = "vnet-asad-dev-01"
    subnet_name          = "backend-subnet"
    pip_name             = "pip-dev-backend-01"
    vm_name              = "backend-vm"
    kv_name              = "kv-asad-dev-01"
    size                 = "Standard_F2"
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
