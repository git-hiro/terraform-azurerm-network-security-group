output "nsg" {
  value = "${
    map(
      "resource_group_name", "${azurerm_network_security_group.nsg.resource_group_name}",
      "id", "${azurerm_network_security_group.nsg.id}",
      "name", "${azurerm_network_security_group.nsg.name}",
    )
  }"
}
