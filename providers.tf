terraform {
  required_version = ">=1.4.0"

required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    mailgun = {
      source  = "terraform-providers/mailgun"
      version = "~> 0.5"
    }
  }
}

# DigitalOcean Provider Configuration
provider "digitalocean" {
  token = var.do_token
}

# Mailgun Provider Configuration (for email notifications)
provider "mailgun" {
  api_key = var.mailgun_api_key
}