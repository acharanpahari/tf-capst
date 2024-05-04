output "linux_vm_id" {
  value = azurerm_linux_virtual_machine.linux_vm.id
}

output "linux_vm_private_ip" {
  value = azurerm_linux_virtual_machine.linux_vm.private_ip_address
}

output "linux_vm_public_ip" {
  value = azurerm_linux_virtual_machine.linux_vm.public_ip_address
}

output "vm_ssh_key" {
  value = tls_private_key.ssh-key.private_key_pem
  sensitive = true
}