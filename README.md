# DigitalOcean-using-Terraform
production-ready Terraform setup to deploy Discourse on DigitalOcean using Terraform

This Terraform project deploys **Discourse** on **DigitalOcean**, integrating:  
✅ Droplet (VM) Deployment  
✅ Load Balancer for Scalability  
✅ DNS Management with DigitalOcean DNS  
✅ Email Configuration with Mailgun  
✅ Terraform Best Practices (State Management, Security, Variables, etc.) 

## 📌 Prerequisites

1. **DigitalOcean API Token**  
   - Create at [DigitalOcean API](https://cloud.digitalocean.com/account/api)  
   - Store it securely:  
     ```sh
     export TF_VAR_do_token="your-digitalocean-api-token"
     ```

2. **Mailgun API Key (For Email Notifications)**  
   - Create at [Mailgun](https://www.mailgun.com/)  
   - Store it securely:  
     ```sh
     export TF_VAR_mailgun_api_key="your-mailgun-api-key"
     ```

3. **SSH Key for Secure Access**  
   - Generate an SSH key pair if you don’t have one:  
     ```sh
     ssh-keygen -t rsa -b 4096 -C "your-email@example.com"
     ```
   - Add the public key to your DigitalOcean account.


✅ DigitalOcean Droplet for Discourse
✅ Floating IP for High Availability
✅ Load Balancer for Scalability
✅ DigitalOcean DNS for Custom Domain
✅ Mailgun for Email Notifications
✅ Remote State Management for Security
