resource "google_storage_bucket" "tfstate" {
  name    = "${var.account_name}-tfstate"
  project = "${google_project.infra.id}"
}
