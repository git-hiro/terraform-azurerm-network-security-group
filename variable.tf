variable "nsg" {
  default = {
    resource_group_name = ""

    name     = ""
    location = ""
  }
}

variable "rules" {
  default = []
}
