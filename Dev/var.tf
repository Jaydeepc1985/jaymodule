variable "rg_name_x" {
  type = map(object({
    name     = string
    location = string
  }))

}
variable "stg_x" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
}

variable "cnt_x" {
  type = map(object({
    name                  = string
    storage_account_id    = string
    container_access_type = string
  }))

}
# variable "flexi_server_x" {
#   type = map(object({
#     name                   = string
#     resource_group_name    = string
#     location               = string
#     administrator_login    = string
#     administrator_password = string
#     sku                    = string
#     version                = string
#     tags                   = map(string)
#   }))

# }
variable "vnet_x" {
  type = map(object({
    name                = string
    address_space       = list(string)
    location            = string
    resource_group_name = string
  }))

}

variable "sub_front_x" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)

  }))

}
variable "sub_back_x" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)

  }))
}

variable "public_ip_x" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    sku                 = string
  }))
}
variable "nic_frontend_x" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    ip_configuration = map(object({
      name                          = string
      subnet_id                     = string
      private_ip_address_allocation = string
      public_ip_address_id          = string
    }))
  }))
}
variable "nic_backend_x" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    ip_configuration = map(object({
      name                          = string
      subnet_id                     = string
      private_ip_address_allocation = string
      public_ip_address_id          = string
    }))
  }))
}
variable "frontend_vm_x" {
  type = map(object({
    name                            = string
    location                        = string
    resource_group_name             = string
    size                            = string
    admin_username                  = string
    admin_password                  = string
    disable_password_authentication = bool
    network_interface_ids           = list(string)
    os_disk = map(object({
      name                 = string
      caching              = string
      storage_account_type = string
      disk_size_gb         = number
    }))
    source_image_reference = map(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    }))

  }))

}
variable "backend_vm_x" {
  type = map(object({
    name                            = string
    location                        = string
    resource_group_name             = string
    size                            = string
    admin_username                  = string
    admin_password                  = string
    disable_password_authentication = bool
    network_interface_ids           = list(string)
    os_disk = map(object({
      name                 = string
      caching              = string
      storage_account_type = string
      disk_size_gb         = number
    }))
    source_image_reference = map(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    }))

  }))

}
variable "NSG_x" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    security_rule = map(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
    tags = map(string)
  }))

}
variable "sql-server_x" {
  description = "Map of SQL Server configurations"
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = string
    tags                         = map(string)
  }))

}
variable "sql-database_x" {
  description = "Map of SQL Database configurations"
  type = map(object({
    name         = string
    server_id    = string
    max_size_gb  = number
    sku_name     = string
    enclave_type = string
    tags         = map(string)
  }))
}