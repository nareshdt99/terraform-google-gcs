# Changelog

## [Unreleased]

### Added
- Created `variables.tf` to define the variables for the GCS bucket configuration:
  - `bucket_name`: The name of the GCS bucket.
  - `force_destroy`: Whether to force destroy the bucket when deleting. Default is `false`.
  - `project`: The project ID where the bucket will be created.
  - `versioning_enabled`: Whether to enable versioning on the bucket. Default is `false`.

- Created `output.tf` to define the outputs for the GCS bucket:
  - `bucket_name`: The name of the created GCS bucket.
  - `bucket_url`: The URL of the created GCS bucket.

- Created `version.tf` to specify the required Terraform and provider versions:
  - Google provider source: `hashicorp/google`
  - Google provider version: `>= 5.30.0`

- Added provider configuration to `main.tf`:
  - Specified `google` provider with `project` and `region` set to `us-central1`.

- Created `main.tf` to define the GCS bucket resource:
  - `google_storage_bucket` resource with the following properties:
    - `name`: Set to `var.bucket_name`.
    - `location`: Fixed to `"US"`.
    - `force_destroy`: Set to `var.force_destroy`.
    - `project`: Set to `var.project`.
    - `public_access_prevention`: Fixed to `"enforced"`.
    - `versioning`: Enabled if `var.versioning_enabled` is `true`.

### Steps to Reproduce

1. Create a new directory for your Terraform configuration.
2. Create a `main.tf` file with the following content:
    ```hcl
    resource "google_storage_bucket" "mybucket" {
      name          = var.bucket_name
      location      = "US"
      force_destroy = var.force_destroy
      project       = var.project
      public_access_prevention = "enforced"
      versioning {
        enabled = var.versioning_enabled
      }
    }

    provider "google" {
      project = var.project
      region  = "us"
    }
    ```
3. Create a `variables.tf` file with the following content:
    ```hcl
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
    ```

4. Create an `output.tf` file with the following content:
    ```hcl
    output "bucket_name" {
      description = "The name of the created GCS bucket"
      value       = google_storage_bucket.mybucket.name
    }

    output "bucket_url" {
      description = "The URL of the created GCS bucket"
      value       = google_storage_bucket.mybucket.url
    }
    ```

5. Create a `version.tf` file with the following content:
    ```hcl
    terraform {

      required_providers {
        google = {
          source  = "hashicorp/google"
          version = ">= 5.30.0"
        }
      }
    }

    provider "google" {
      project = var.project
      region  = "us-central1"
    }
    ```

6. Create a `changelog.md` file with this content to track changes.
7. Initialize your Terraform configuration by running `terraform init`.
8. Apply the configuration by running `terraform apply`.

### Changes in Future Releases
- Plan to add support for additional bucket configurations like lifecycle rules and logging.
- Consider adding more detailed variable descriptions and validations.
