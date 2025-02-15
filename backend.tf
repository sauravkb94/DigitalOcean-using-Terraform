terraform {
  backend "s3" {
    bucket                      = "terraform-state-bucket"
    key                         = "discourse/prod.tfstate"
    region                      = "nyc3"
    endpoint                    = "https://nyc3.digitaloceanspaces.com"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
  }
}