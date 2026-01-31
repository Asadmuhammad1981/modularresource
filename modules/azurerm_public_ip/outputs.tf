# output "public_ip_ids" {
#   description = "Map of public IP resource IDs, keyed by the input key (e.g. 'bastion-pip')"
#   value = {
#     for k, pip in azurerm_public_ip.pip : k => pip.id
#   }
# }