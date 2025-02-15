variable "do_token" {
  description = "DigitalOcean API Token"
  type        = string
  sensitive   = true
}

variable "do_region" {
  description = "DigitalOcean region for the droplet"
  type        = string
  default     = "nyc3"
}

variable "vm_size" {
  description = "Droplet size"
  type        = string
  default     = "s-2vcpu-4gb"
}

variable "domain_name" {
  description = "Domain name for Discourse"
  type        = string
}

variable "ssh_public_key" {
  description = "Path to SSH public key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "mailgun_api_key" {
  description = "Mailgun API Key"
  type        = string
  sensitive   = true
}

variable "mailgun_domain" {
  description = "Mailgun domain"
  type        = string
}

variable "forward_email" {
  description = "Email to forward Discourse notifications"
  type        = string
}