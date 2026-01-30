resource "azurerm_bastion_host" "bastion" {
  name                = var.bastion
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.subnets.id
    public_ip_address_id = azurerm_public_ip.pip2.id
  }
}