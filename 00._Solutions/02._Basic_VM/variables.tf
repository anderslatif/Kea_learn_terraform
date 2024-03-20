variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "vm_username" {
  description = "The admin username for the virtual machine"
  type        = string
}

variable "vm_password" {
  description = "The admin password for the virtual machine"
  type        = string
  sensitive   = true
}
