variable "nsg" {
  default = {
    resource_group_name = ""

    name     = ""
    location = "japaneast"
  }
}

variable "rules" {
  default = []
}
