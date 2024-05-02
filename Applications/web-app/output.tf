
output "rg-name" {
  value = module.web_app_rg.resource_group_name
}

output "rg-location" {
  value = module.web_app_rg.resource_group_location
}

output "rg-id" {
  value = module.web_app_rg.resource_group_id
}

output "vnet-id" {
  value = module.web_app_vnet.vnet_id
}
output "vnet-name" {
  value = module.web_app_vnet.vnet_name
}
output "vnet-cidr" {
  value = module.web_app_vnet.vnet_cidr
}

output "subnet-id" {
  value = module.web_app_subnet.subnet_id
}

output "subnet-name" {
  value = module.web_app_subnet.subnet_name
}

output "nsg-id" {
  value = module.web_app_nsg.nsg_id
}

output "public-ip-id" {
  value = module.web_app_public_ip.public_ip_id
}

output "public-ip" {
  value = module.web_app_public_ip.public_ip
}

output "nic-id" {
  value = module.web_app_vm_nic.nic_id
}

output "vm-id" {
  value = module.web_linux_vm.linux_vm_id
}

output "vm-private-ip" {
  value = module.web_linux_vm.linux_vm_private_ip
}

output "vm-public-ip" {
  value = module.web_linux_vm.linux_vm_public_ip
}