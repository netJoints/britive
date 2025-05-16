terraform {
  required_providers {
    britive = {
      source = "britive/britive"
      version = ">= 2.1"
    }
  }
}

variable "britive_tenant" {
    description = "The Britive tenant FQDN starting with https://"
    type 	= string
    }

variable "britive_token" {
     description = "Secret token for the tenant"
     type	= string
     }


# Configure the Britive Provider

provider "britive" {
    tenant = var.britive_tenant
    token  = var.britive_token
}


data "britive_identity_provider" "idp" {
    name = "Britive"
}

# Resource to create a tag
resource "britive_tag" "tenant_helpdesk_team" {
    name  = "Help Desk Users"
    description   = "TF: Users participating in the Demo"
    identity_provider_id = data.britive_identity_provider.idp.id
}
