module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "virtual_networks" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_virtual_network"
  vnet       = var.vnet
}

module "subnets" {
  depends_on = [module.resource_group, module.virtual_networks]
  source     = "../../modules/azurerm_subnet"
  subnets    = var.subnets
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_public_ip"
  public_ips = var.public_ips
}

module "key_vault" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_key_vault"
  key_vaults = var.key_vaults
}

module "sql_server" {
  depends_on     = [module.resource_group]
  source         = "../../modules/azurerm_sql_server"
  sql_server     = "sql-dev-01"
  rg_name        = "rg-asad-dev-01"
  location       = "centralindia"
  admin_username = "devopsadmin"
  admin_password = "P@ssw01rd@123"
  tags           = {}
}

module "sql_db" {
  depends_on  = [module.sql_server, module.resource_group]
  source      = "../../modules/azurerm_sql_database"
  sql_db      = "sqldb-dev-01"
  server_id   = module.sql_server.server_id
  max_size_gb = "2"
  tags        = {}
}


module "compute" {
  depends_on = [module.subnets, module.virtual_networks, module.public_ip, module.key_vault, module.resource_group]
  source     = "../../modules/azurerm_compute"
  vms        = var.vms
}

module "bastion" {
  depends_on = [module.subnets, module.virtual_networks, module.public_ip, module.resource_group]
  source     = "../../modules/azurerm_bastion_server"
  bastion    = var.bastion
  # bastion_subnet_id = module.subnets.subnet_ids["AzureBastionSubnet"]
  # bastion_pip_id    = module.public_ip.public_ip_ids["pip-dev-bastion-01"]
}