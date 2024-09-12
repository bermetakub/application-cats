variable "region" {
  type = string
  default = "us-west1"
}

variable "zone" {
  type = string
  default = "us-west1-b"
}

variable "project_id" {
  description = "Project ID where the GKE cluster will be created."
  type        = string
}

variable "name" {
  type = string
  description = "The name to use"  
  default = "bermet"
}

variable "auto_create_subnetworks" {
  description = "It will create a subnet for each region automatically across the across CIDR-block range, if it is <true> "
  type = bool
  default = false
}

variable "routing_mode" {
  description = "The network routing mode"
  type = string
  default = "GLOBAL"
}

variable "public_subnet_name" {
  description = "Name of the public subnet"
  type = string
  default = "public"
}

variable "subnet_CIDR" {
  description = "List of public subnets."
  type = string
  default = "10.100.0.0/16"  
}
