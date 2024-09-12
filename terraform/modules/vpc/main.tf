resource "google_compute_network" "vpc" {
  name = var.name
  auto_create_subnetworks = var.auto_create_subnetworks
  routing_mode = var.routing_mode
}


resource "google_compute_subnetwork" "subnet" {
  name = var.public_subnet_name
  ip_cidr_range = var.subnet_CIDR
  region        = var.region
  network       = google_compute_network.vpc.id
}

resource "google_compute_router" "router" {
  project = var.project_id
  name = var.name
  region = var.region
  network = google_compute_network.vpc.name
}

resource "google_compute_router_nat" "nat_router" {
  project = var.project_id
  name = var.name
  router = google_compute_router.router.name
  region = google_compute_router.router.region
  nat_ip_allocate_option = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  depends_on = [
    google_compute_subnetwork.subnet,
  ]
}

resource "google_compute_route" "route-igw" {
  name         = "IGW"
  dest_range   = "0.0.0.0/0"
  network      = google_compute_network.vpc.name
  next_hop_internet = "true"
  priority     = 1000
}

resource "google_compute_firewall" "default" {
  project = var.project_id
  name    = "ssh-firewall"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}
