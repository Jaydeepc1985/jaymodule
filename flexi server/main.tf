# resource "azurerm_mysql_flexible_server" "server-jay" {
#     for_each = var.flexi_server
#   name                   = each.value.name
#   resource_group_name    = each.value.resource_group_name
#   location               = each.value.location
#   administrator_login    = each.value.administrator_login
#   administrator_password = each.value.administrator_password
#   version                = each.value.version
#   sku_name               = each.value.sku
#   tags = {
#     environment   = each.value.tags["environment"]
#     workload_type = each.value.tags["workload_type"]
    

#   }
# }