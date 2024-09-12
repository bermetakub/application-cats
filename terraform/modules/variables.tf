variable "project_id" {
  description = "The GCP Project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
}

variable "dns_zone_name" {
  description = "The name of the DNS zone"
  type        = string
}

variable "dns_name" {
  description = "The DNS name of the zone"
  type        = string
}

variable "zone" {
  type = string
  description = "GCP zone"
}


variable db_version {
  description = "The version of of the database. For example, POSTGRES_9_6 or POSTGRES_11"
  default = "POSTGRES_11"
}
variable db_tier {
  description = "The machine tier (First Generation) or type (Second Generation). Reference: https://cloud.google.com/sql/pricing"
  default = "db-f1-micro"
}

variable db_instance_access_cidr {
  description = "The IPv4 CIDR to provide access the database instance"
  default = "0.0.0.0/0"
}
# database settings
variable db_name {
  description = "Name of the default database to create"
  default = "postgres"
}

variable db_user_name {
  description = "The name of the default user"
  default = "postgres"
}

variable db_user_password {
  description = "The password for the default user. If not set, a  random one will be generated and available in the  generated_user_password output variable."
  default = "postgres"
}

variable "credentials_file_path" {
  type = string
}

variable "name" {
  type = string
  description = "Name that will be used as name of resources"
}

variable "subnet_CIDR" {
  description = "List of public subnets."
  type = string 
}


variable "initial_node_count" {
  description = "Initial number of nodes."
  type        = number
}

variable "min_node_count" {
  description = "Minimum number of nodes for autoscaling."
  type        = number
}

variable "max_node_count" {
  description = "Maximum number of nodes for autoscaling."
  type        = number
}

variable "machine_type" {
  description = "Machine type for nodes."
  type        = string
}


