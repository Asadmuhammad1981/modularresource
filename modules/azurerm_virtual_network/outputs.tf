# output "subnet_ids" {
#   description = "Map of subnet resource IDs keyed by subnet name"
#   value = {
#     for k, subnet in azurerm_subnet.subnets : subnet.name => subnet.id
#   }
# }

# # output "subnet_ids" {
# #   value = { for k, subnet in azurerm_subnet.subnet : k => subnet.id }
# # }