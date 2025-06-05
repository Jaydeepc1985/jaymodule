rg_name_x = {
  "rg1" = {
    name     = "jaydeep_rg1"
    location = "Central india"

  }
  "rg2" = {
    name     = "jaydeep_rg"
    location = "Central india"

  }
}
stg_x = {
  "stg1" = {
    name                     = "jaydeepstg321"
    resource_group_name      = "jaydeep_rg"
    location                 = "Central india"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

cnt_x = {
  "cnt2" = {
    name                  = "jaydeepcnt321"
    storage_account_id    = "stg1"
    container_access_type = "private"

  }
}
# flexi_server_x = {
#   "srv" = {
#     name                   = "jaydeepflexi-srver"
#     resource_group_name    = "jaydeep_rg1"
#     location               = "Central india"
#     administrator_login    = "jaydeepc1985"
#     administrator_password = "Oneday@123"
#     sku                    = "B_Standard_B1ms"
#     version                = "8.0.21"
#     tags = {
#       environment   = "dev"
#       workload_type = "Dev/Test"

#     }

#   }
# }
vnet_x = {
  "vnet_z" = {
    name                = "JaydeepVnet"
    address_space       = ["10.16.0.0/27"]
    location            = "Central india"
    resource_group_name = "jaydeep_rg1"

  }
}
sub_front_x = {
  "front_x" = {
    name                 = "frontend_jay"
    resource_group_name  = "jaydeep_rg1"
    virtual_network_name = "JaydeepVnet"
    address_prefixes     = ["10.16.0.0/28"]

  }
}
sub_back_x = {
  "back_x" = {
    name                 = "backend_jay"
    resource_group_name  = "jaydeep_rg1"
    virtual_network_name = "JaydeepVnet"
    address_prefixes     = ["10.16.0.16/28"]

  }
}
public_ip_x = {
  "pub-ip_front" = {
    name                = "frontend-public-ip"
    resource_group_name = "jaydeep_rg1"
    location            = "Central india"
    allocation_method   = "Static"
    sku                 = "Basic"

  }
  "pub-ip_back" = {
    name                = "backend-public-ip"
    resource_group_name = "jaydeep_rg1"
    location            = "Central india"
    allocation_method   = "Static"
    sku                 = "Basic"
  }
}
nic_frontend_x = {
  "nic_front" = {
    name                = "nic-frontend-jay"
    location            = "Central india"
    resource_group_name = "jaydeep_rg1"
    ip_configuration = {
      "ipconfig1" = {
        name                          = "ipconfig1"
        private_ip_address_allocation = "Dynamic"
        subnet_id                     = "cdk"
        public_ip_address_id          = "xdk"
      }
    }
  }
}
nic_backend_x = {
  "nic_back" = {
    name                = "nic-backend-jay"
    location            = "Central india"
    resource_group_name = "jaydeep_rg1"
    ip_configuration = {
      "ipconfig2" = {
        name                          = "ipconfig2"
        private_ip_address_allocation = "Dynamic"
        subnet_id                     = "sdk"
        public_ip_address_id          = "ydk"
      }
    }
  }
}
frontend_vm_x = {
  "frontend_vm_x" = {
    name                            = "jaydeep-frontend-vm"
    location                        = "Central india"
    resource_group_name             = "jaydeep_rg1"
    network_interface_ids           = ["net_front"]
    size                            = "Standard_B1s"
    admin_username                  = "jaydeepc1985"
    admin_password                  = "Oneday@1231985"
    disable_password_authentication = false
    os_disk = {
      "osdisk-jaydeep" = {
        name                 = "osdisk-jaydeep"
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
        disk_size_gb         = 30
      }
    }
    source_image_reference = {
      "Canonnical" = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-LTS"
        version   = "latest"
      }

    }
    tags = {
      role = "frontend"
    }
  }
}
backend_vm_x = {
  "backend_vm_x" = {
    name                            = "jaydeep-backend-vm"
    location                        = "Central india"
    resource_group_name             = "jaydeep_rg1"
    network_interface_ids           = ["net_back"]
    size                            = "Standard_B1s"
    admin_username                  = "jaydeepc1985"
    admin_password                  = "Oneday@1231985"
    disable_password_authentication = false
    os_disk = {
      "osdisk-jaydeep1" = {
        name                 = "osdisk-jaydeep1"
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
        disk_size_gb         = 30
      }
    }
    source_image_reference = {
      "Canonnical" = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-focal"
        sku       = "20_04-lts"
        version   = "latest"
      }

    }
    tags = {
      role = "backend"
    }
  }
}
NSG_x = {
  "NSG_front" = {
    name                = "jaydeep-nsg-front"
    location            = "Central india"
    resource_group_name = "jaydeep_rg1"
    security_rule = {
      "rule1" = {
        name                       = "Allow-HTTP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
      "rule2" = {
        name                       = "Allow-SSH"
        priority                   = 200
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
    tags = {
      environment = "dev"
    }
  }
  "NSG_back" = {
    name                = "jaydeep-nsg-back"
    location            = "Central india"
    resource_group_name = "jaydeep_rg1"
    security_rule = {
      "rule1" = {
        name                       = "Allow-SSH"
        priority                   = 200
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
      "rule1" = {
        name                       = "Allow-SSH"
        priority                   = 210
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "8000"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
    tags = {
      environment = "production"
    }
  }
}
sql-server_x = {
  "sql-server" = {
    name                         = "jaydeep-sql-server"
    resource_group_name          = "jaydeep_rg1"
    location                     = "Central india"
    version                      = "12.0"
    administrator_login          = "jaydeepc1985"
    administrator_login_password = "Oneday@123"
    minimum_tls_version          = "1.2"
    tags = {
      environment = "dev"
      project     = "SQLProject"
    }
  }
}
sql-database_x = {
  "sql-database" = {
    name         = "jaydeep-sql-database"
    server_id    = "sql"
    max_size_gb  = 2
    sku_name     = "S0"
    enclave_type = "VBS"
    tags = {
      environment = "dev"
      project     = "SQLProject"
    }
  }
}