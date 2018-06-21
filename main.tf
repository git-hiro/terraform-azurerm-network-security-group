resource "azurerm_network_security_group" "nsg" {
  resource_group_name = "${var.nsg["resource_group_name"]}"

  name     = "${var.nsg["name"]}"
  location = "${var.nsg["location"]}"
}

resource "azurerm_network_security_rule" "rules" {
  count = "${length(var.rules)}"

  resource_group_name         = "${azurerm_network_security_group.nsg.resource_group_name}"
  network_security_group_name = "${azurerm_network_security_group.nsg.name}"

  name     = "${lookup(var.rules[count.index], "name")}"
  priority = "${lookup(var.rules[count.index], "priority")}"

  access    = "${lookup(var.rules[count.index], "access")}"
  direction = "${lookup(var.rules[count.index], "direction")}"
  protocol  = "${lookup(var.rules[count.index], "protocol")}"

  source_address_prefix      = "${lookup(var.rules[count.index], "source_address_prefix")}"
  source_port_range          = "${lookup(var.rules[count.index], "source_port_range")}"
  destination_address_prefix = "${lookup(var.rules[count.index], "destination_address_prefix")}"
  destination_port_range     = "${lookup(var.rules[count.index], "destination_port_range")}"
}
