resource "google_storage_bucket" "mybucket" {
  name          = var.bucket_name
  location      = "US"
  force_destroy = var.force_destroy
  project = var.project
  public_access_prevention = "enforced"
  versioning {
    enabled = var.versioning_enabled
  }
}