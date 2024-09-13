terraform {
  backend "s3" {
    bucket = "ovh-sah-terraform-state-s3"
    key    = "terraform.tfstate"
    region = "rbx"

    endpoints = {
      s3 = "https://s3.rbx.io.cloud.ovh.net/"
    }

    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}
