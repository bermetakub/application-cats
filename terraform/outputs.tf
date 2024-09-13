output "dns_managed_zone_name" {
  value = google_dns_managed_zone.primary.name
}

output db_instance_address {
  description = "IP address of the master database instance"
  value = google_sql_database_instance.postgresql.ip_address
}