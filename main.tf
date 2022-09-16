terraform {
  required_version = ">= 0.13"
  required_providers {
    tfe = {
      version = "~> 0.36.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "tfe" {
  hostname = var.tfc_host
  token    = var.tfc_token
}

provider "github" {
  token = var.github_token
}

