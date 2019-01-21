resource "google_project" "tfstate" {
  location_id = "${var.backend_location}"
  name        = "tfstate"
  project_id  = "tfstate"
}
