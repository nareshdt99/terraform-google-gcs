variable "bucket_name" {
  description = "The name of the GCS bucket"
  type        = string
}

variable "force_destroy" {
  description = "Whether to force destroy the bucket when deleting"
  type        = bool
  default     = false
}

variable "project" {
  description = "The project ID where the bucket will be created"
  type        = string
}

variable "versioning_enabled" {
  description = "Whether to enable versioning on the bucket"
  type        = bool
  default     = false
}
