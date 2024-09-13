variable "vault_token" {
  description = "Hashicorp Vault Token"
  sensitive   = true
  type        = string
  nullable    = false
}
