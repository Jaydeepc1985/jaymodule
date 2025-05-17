data "azurerm_subnet" "cdk" {
    name                = "frontend_jay"
    virtual_network_name = "JaydeepVnet"
    resource_group_name = "jaydeep_rg1"
  
}
data "azurerm_subnet" "sdk" {
    name                = "backend_jay"
    virtual_network_name = "JaydeepVnet"
    resource_group_name = "jaydeep_rg1"
  
}
data "azurerm_public_ip" "xdk" {
    name                = "frontend-public-ip"
    resource_group_name = "jaydeep_rg1"
  
}
data "azurerm_public_ip" "ydk" {
    name                = "backend-public-ip"
    resource_group_name = "jaydeep_rg1"
  
}


resource "azurerm_network_interface" "nic_frontend" {
    for_each = var.nic_frontend
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "ip_configuration" {
    for_each = each.value.ip_configuration
    content {
      name                          = ip_configuration.value.name
      subnet_id                     = data.azurerm_subnet.cdk.id
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
      public_ip_address_id          = data.azurerm_public_ip.xdk.id
    }
  }
}
resource "azurerm_network_interface" "nic_backend" {
    for_each = var.nic_backend
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "ip_configuration" {
    for_each = each.value.ip_configuration
    content {
      name                          = ip_configuration.value.name
      subnet_id                     = data.azurerm_subnet.sdk.id
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
      public_ip_address_id          = data.azurerm_public_ip.ydk.id
    }
  }
}