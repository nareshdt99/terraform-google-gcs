output "bucket_name" {
  description = "The name of the created GCS bucket"
  value       = google_storage_bucket.mybucket.name
}

output "bucket_url" {
  description = "The URL of the created GCS bucket"
  value       = google_storage_bucket.mybucket.url
}
