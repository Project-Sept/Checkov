variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  
}

variable "pip_name" {
  description = "Name of the public IP address"
  type        = string
  
}

variable "nic" {
  description = "Name of the network interface"
  type        = string
  
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
  
}

variable "rg_name" {
  description = "Name of the resource group"
  type        = string
  
}

variable "rg_location" {
  description = "Location of the resource group"
  type        = string
  
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_DS1_v2"
  
}

# variable "admin_username" {
#   description = "Admin username for the virtual machine"
#   type        = string
  
# }

# variable "admin_password" {
#   description = "Admin password for the virtual machine"
#   type        = string

# }

variable "image_publisher" {
  description = "Publisher of the image"
  type        = string
  
}

variable "image_offer" {
  description = "Offer of the image"
  type        = string

}

variable "image_sku" {
  description = "SKU of the image"
  type        = string

}

variable "image_version" {
  description = "Version of the image"
  type        = string

}

variable "install_nginx" {
  description = "Flag to install Nginx on the VM"
  type        = bool
  default     = false
  
}