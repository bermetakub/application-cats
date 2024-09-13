provider "google" {
  credentials = file(var.credentials_file_path)

  project = var.project_id
  region  = var.region
  zone    = var.zone
}

module "google_networks" {
  source = "./modules/vpc"

  region = var.region
  zone = var.zone
  project_id = var.project_id
  name = var.name
  subnet_CIDR = var.subnet_CIDR
  firewall_rules = var.firewall_rules
  # authorized_ipv4_cidr_block = var.bastion_ip
}

module "google_kubernetes_cluster" {
  source = "./modules/gke"

  project_id = var.project_id
  cluster_name = var.name
  location = var.zone
  initial_node_count = var.initial_node_count
  network = module.google_networks.vpc_name
  subnet_name = module.google_networks.subnet
  node_pool_name = var.name
  max_node_count = var.max_node_count
  min_node_count = var.min_node_count
  machine_type = var.machine_type
}

resource "google_dns_managed_zone" "primary" {
  name        = var.dns_zone_name
  dns_name    = var.dns_name
  description = "Managed zone for ${var.dns_name}"

  visibility = "public"
}

resource "google_sql_database_instance" "postgresql" {
  name = var.db_name
  project = var.project_id
  region = "${var.region}"
  database_version = "${var.db_version}"
  deletion_protection = false

  settings {
    tier = "${var.db_tier}"
    
    location_preference {
      zone = "${var.zone}"
    }

    ip_configuration {
      ipv4_enabled = "true"
      authorized_networks {
        value = "${var.db_instance_access_cidr}"
      }
    }
  }
}

resource "google_sql_user" "postgresql_user" {
  name = "${var.db_user_name}"
  project = var.project_id
  instance = "${google_sql_database_instance.postgresql.name}"
  password = "postgres"
}