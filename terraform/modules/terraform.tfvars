project_id = "PROJECT-ID"
region = "us-central1"
zone = "us-central1-a"
credentials_file_path = "./CREDENTIALS.json"
name = "NAME"
routes = [ {
    name              = "igw-route"
    destination_range = "0.0.0.0/0"
    next_hop_internet = "true"
} ]
subnet_CIDR = "10.0.0.0/24"
initial_node_count = 1
min_node_count = 1
max_node_count = 3
machine_type = "e2-medium"
dns_zone_name = "DEMO"
dns_name = "example.online"