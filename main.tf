resource "digitalocean_droplet" "sample_discouse" {
    name     = "discourse-server"
    region   = var.do_region
    size     = var.vm_size
    image    = "ubuntu-22-04-x64"
    ssh_keys = [digitalocean_ssh_key.default.id]
}
# SSH Key for Secure Access
resource "digitalocean_ssh_key" "default" {
  name       = "Terraform SSH Key"
  public_key = file(var.ssh_public_key)
}

# Create a Floating IP for High Availability
resource "digitalocean_floating_ip" "ip" {
  region = var.do_region
}

# Assign Floating IP to the Droplet
resource "digitalocean_floating_ip_assignment" "ip_assign" {
  ip_address = digitalocean_floating_ip.ip.ip_address
  droplet_id = digitalocean_droplet.discourse.id
}

# Set Up a Load Balancer
resource "digitalocean_loadbalancer" "lb" {
  name   = "discourse-lb"
  region = var.do_region

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"
    target_port    = 80
    target_protocol = "http"
  }

  forwarding_rule {
    entry_port     = 443
    entry_protocol = "https"
    target_port    = 443
    target_protocol = "https"
  }

  healthcheck {
    protocol = "http"
    port     = 80
    path     = "/"
  }

  droplet_ids = [digitalocean_droplet.discourse.id]
}

# Set Up a DigitalOcean DNS Record
resource "digitalocean_record" "dns" {
  domain = var.domain_name
  type   = "A"
  name   = "discourse"
  value  = digitalocean_floating_ip.ip.ip_address
}

# Mailgun Configuration for Discourse Email
resource "mailgun_domain" "email_domain" {
  domain = var.mailgun_domain
}

resource "mailgun_route" "route" {
  priority = 10
  description = "Forward discourse emails"
  expression = "match_recipient('discourse@${var.mailgun_domain}')"
  action {
    type = "forward"
    value = var.forward_email
  }
}

