variable "frontend_vm" {
    type = map(object({
        name                = string
        location            = string
        resource_group_name = string
        size             = string
        admin_username      = string
        admin_password      = string
        disable_password_authentication = bool
        network_interface_ids   = list(string)
        os_disk             = map(object({
        name              = string
        caching           = string
        storage_account_type     = string
        disk_size_gb = number
        }))
       source_image_reference = map(object({
        publisher = string
        offer     = string
        sku       = string
        version   = string
        }))
        
    }))
  
}
variable "backend_vm" {
    type = map(object({
        name                = string
        location            = string
        resource_group_name = string
        size             = string
        admin_username      = string
        admin_password      = string
        disable_password_authentication = bool
        network_interface_ids   = list(string)
        os_disk             = map(object({
        name              = string
        caching           = string
        storage_account_type     = string
        disk_size_gb = number
        }))
       source_image_reference = map(object({
        publisher = string
        offer     = string
        sku       = string
        version   = string
        }))
        
    }))
  
}