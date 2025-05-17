module "xyz" {
  source  = "../resource"
  rg_name = var.rg_name_x
}
module "abc" {
  source     = "../storage"
  stg        = var.stg_x
  cnt        = var.cnt_x
  depends_on = [module.xyz]
}
module "flexi_server" {
  source       = "../flexi server"
  flexi_server = var.flexi_server_x
  depends_on   = [module.abc]
}
module "Vnet" {
  source     = "../vnet"
  vnet_y     = var.vnet_x
  depends_on = [module.xyz]

}
module "subnet" {
  source     = "../subnet"
  sub_front  = var.sub_front_x
  sub_back   = var.sub_back_x
  depends_on = [module.Vnet]
}
module "public_ip" {
  source     = "../publicip"
  public_ip  = var.public_ip_x
  depends_on = [module.Vnet, ]

}
module "nic" {
  source       = "../nic"
  nic_frontend = var.nic_frontend_x
  nic_backend  = var.nic_backend_x
  depends_on   = [module.subnet, module.public_ip]
}
module "VM" {
  source      = "../VM"
  frontend_vm = var.frontend_vm_x
  backend_vm  = var.backend_vm_x
  depends_on  = [module.nic]

}
module "NSG" {
  source     = "../NSG"
  NSG        = var.NSG_x
  depends_on = [module.nic,module.VM]

}