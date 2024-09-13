terraform {
  required_version = "1.9.5"

  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 2.1.0"
    }

    ovh = {
      source  = "ovh/ovh"
      version = "~> 0.49.0"
    }

    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.4.0"
    }
  }
}


provider "openstack" {
  auth_url = "https://auth.cloud.ovh.net/v3/"
}

provider "ovh" {
  endpoint           = "ovh-eu"
  application_key    = var.application_key
  application_secret = var.application_secret
  consumer_key       = var.consumer_key
}


# # Configure the Vault provider hosted by Hashicorp
# provider "vault" {
#   address = "http://127.0.0.1:8200"
#   token   = var.vault_token
# }


# # Fetch all secrets in Hashicorp Vault
# data "vault_generic_secret" "ovh_credentials" {
#   path = "prod-secrets/OVH"
# }
