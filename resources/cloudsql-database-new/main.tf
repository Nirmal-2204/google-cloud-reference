 locals {
  # Name restrictions https://cloud.google.com/sql/docs/postgres/instance-settings
  # The total length of project-ID:instance-ID must be 98 characters or less.
  default_name = substr("${var.app_id}-${var.env_id}", 0, 98 - length(var.project))

  default_database = "main"
  default_username = "cloudsql"
}

resource "random_password" "password" {
  length  = 16
  special = false
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/sql_database_instance
data "google_sql_database_instance" "instance" {
  name = var.instance_name
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database
resource "google_sql_database" "main" {
  name     = local.default_name
  instance = var.instance_name
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user
resource "google_sql_user" "main" {
  name     = local.default_username
  instance = var.instance_name
  password = random_password.password.result
}
