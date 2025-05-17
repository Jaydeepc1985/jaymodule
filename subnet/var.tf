variable "sub_front" {
    type = map(object({
        name                = string
        resource_group_name = string
        virtual_network_name = string
        address_prefixes      = list(string)
                
    }))
  
}
variable "sub_back" {
    type = map(object({
        name                = string
        resource_group_name = string
        virtual_network_name = string
        address_prefixes      = list(string)
                
    }))
  
}