########################################
# OVH Variables for API Auth
########################################
variable "application_key" {
  description = "Application Key for OVH Cloud API"
  sensitive   = true
  type        = string
  nullable    = false
}

variable "application_secret" {
  description = "Application Secret for OVH Cloud API"
  sensitive   = true
  type        = string
  nullable    = false
}

variable "consumer_key" {
  description = "Consumer Key for OVH Cloud API"
  sensitive   = true
  type        = string
  nullable    = false
}
