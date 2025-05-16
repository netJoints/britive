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



########### Data source to get the Britive identity provider ID ############

data "britive_identity_provider" "idp" {
    name = "Britive"
}

# Resource to create a tag
resource "britive_tag" "tenant_helpdesk_team" {
    name  = "Help Desk Users"
    description   = "TF: Users participating in the Demo"
    identity_provider_id = data.britive_identity_provider.idp.id
}
resource "britive_tag" "tenant_admins_tag" {
    name  = "Britive Tenant Admins"
    description   = "TF: Admins managing the Britive Platform"
    identity_provider_id = data.britive_identity_provider.idp.id
}
resource "britive_tag" "tenant_infraadmin_tag" {
    name  = "Administrators"
    description   = "TF: Infrastructure Administrators"
    identity_provider_id = data.britive_identity_provider.idp.id
}
resource "britive_tag" "tenant_security_tag" {
    name  = "Security Team"
    description   = "TF: Security Team"
    identity_provider_id = data.britive_identity_provider.idp.id
}
resource "britive_tag" "tenant_useradmins_tag" {
    name  = "User Admins"
    description   = "TF: Admins participating in the user management"
    identity_provider_id = data.britive_identity_provider.idp.id
}
resource "britive_tag" "tenant_engineering_tag" {
    name  = "Engineering Team"
    description   = "TF: Engineering Team"
    identity_provider_id = data.britive_identity_provider.idp.id
}
resource "britive_tag" "tenant_dataplatform_tag" {
    name  = "Data Platform Team"
    description   = "TF: Admins managing the Britive Platform"
    identity_provider_id = data.britive_identity_provider.idp.id
}   
resource "britive_tag" "tenant_platform_tag" {
    name  = "Platform Team"
    description   = "TF: Admins managing the Britive Platform"
    identity_provider_id = data.britive_identity_provider.idp.id
}

resource "britive_tag" "tenant_developer_tag" {
    name  = "Developers"
    description   = "TF: Approvers will approve the profiles or checkouts"
    identity_provider_id = data.britive_identity_provider.idp.id
}

resource "britive_tag" "tenant_testers_tag" {
    name  = "Testers"
    description   = "TF: Admins managing the Britive Platform"
    identity_provider_id = data.britive_identity_provider.idp.id
}

resource "britive_tag" "tenant_BigData_tag" {
    name  = "BigData Team"
    description   = "TF: Approvers will approve the profiles or checkouts"
    identity_provider_id = data.britive_identity_provider.idp.id
}

resource "britive_tag" "tenant_auditor_tag" {
    name  = "External Auditors"
    description   = "TF: External Auditors"
    identity_provider_id = data.britive_identity_provider.idp.id
}
resource "britive_tag" "tenant_aws_systems_admins_tag" {
    name  = "AWS Systems Admins"
    description   = "TF: AWS Systems Admins"
    identity_provider_id = data.britive_identity_provider.idp.id
}

############ Profile related to Britive App ################

data "britive_application" "britive" {
    name = "Britive"
}

resource "britive_profile" "britive_admin" {
    name                = "Britive Admin"
    description         = "TF: Profile for Britive Admin"
    app_container_id    = data.britive_application.britive.id
    expiration_duration = "120m0s"
    notification_prior_to_expiration = "10m0s"

    associations {
    type = "Environment"
    value = "First-Environment"
    }
    destination_url = "https://first-poc.britive-app.com/admin"
  }


resource "britive_profile" "external_auditor" {
  name                             = "External Auditor"
  description                      = "TF: Profile for Auditors"
  app_container_id                 = data.britive_application.britive.id
  expiration_duration              = "80m0s"
  extendable                       = false
  notification_prior_to_expiration = "10m0s"
  extension_duration               = "12m30s"
  extension_limit                  = 2

  associations {
    type  = "Environment"
    value = "First-Environment"
  }

  destination_url = "https://First-poc.britive-app.com/admin/reports"
}


############ Profile related to AWS Standalone App ################


data "britive_application" "aws" {
    name = "AWS Standalone"
}

resource "britive_profile" "security_admin" {
  name                             = "Security Admin"
  description                      = "TF: Profile for Security Team Admins"
  app_container_id                 = data.britive_application.aws.id
  expiration_duration              = "60m0s"
  extendable                       = false
  notification_prior_to_expiration = "10m0s"

  associations {
    type  = "Environment"
    value = "PoC Environment"
  }

  destination_url = "https://console.aws.amazon.com"
}

resource "britive_profile" "infrastructure_admin" {
  name                             = "Infrastructure Admin"
  description                      = "TF: Profile for Infra Admins"
  app_container_id                 = data.britive_application.aws.id
  expiration_duration              = "35m0s"
  extendable                       = false
  notification_prior_to_expiration = "10m0s"
  extension_duration               = "12m30s"
  extension_limit                  = 2

  associations {
    type  = "Environment"
    value = "PoC Environment"
  }

  destination_url = "https://console.aws.amazon.com"
}

resource "britive_profile" "data_analyst" {
  name                             = "Data Analyst"
  description                      = "TF: Profile for Data Analysts"
  app_container_id                 = data.britive_application.aws.id
  expiration_duration              = "45m0s"
  extendable                       = false
  notification_prior_to_expiration = "10m0s"
  extension_duration               = "12m30s"
  extension_limit                  = 2

  associations {
    type  = "Environment"
    value = "PoC Environment"
  }

  destination_url = "https://console.aws.amazon.com"
}

resource "britive_profile" "data_scientist" {
  name                             = "Data Scientist"
  description                      = "TF: Profile for Data Scientists"
  app_container_id                 = data.britive_application.aws.id
  expiration_duration              = "50m0s"
  extendable                       = false
  notification_prior_to_expiration = "10m0s"
  extension_duration               = "12m30s"
  extension_limit                  = 2

  associations {
    type  = "Environment"
    value = "PoC Environment"
  }

  destination_url = "https://console.aws.amazon.com"
}

resource "britive_profile" "application_developer" {
  name                             = "Application Developer"
  description                      = "TF: Profile for App Developers"
  app_container_id                 = data.britive_application.aws.id
  expiration_duration              = "59m0s"
  extendable                       = false
  notification_prior_to_expiration = "10m0s"
  extension_duration               = "12m30s"
  extension_limit                  = 2

  associations {
    type  = "Environment"
    value = "PoC Environment"
  }

  destination_url = "https://console.aws.amazon.com"
}

resource "britive_profile" "tester" {
  name                             = "Tester"
  description                      = "TF: Profile for Testers"
  app_container_id                 = data.britive_application.aws.id
  expiration_duration              = "60m0s"
  extendable                       = false
  notification_prior_to_expiration = "10m0s"
  extension_duration               = "12m30s"
  extension_limit                  = 2

  associations {
    type  = "Environment"
    value = "PoC Environment"
  }

  destination_url = "https://console.aws.amazon.com"
}

resource "britive_profile" "bigdata_team" {
  name                             = "BigData Team"
  description                      = "TF: Profile for Big Data Team"
  app_container_id                 = data.britive_application.aws.id
  expiration_duration              = "70m0s"
  extendable                       = false
  notification_prior_to_expiration = "10m0s"
  extension_duration               = "12m30s"
  extension_limit                  = 2

  associations {
    type  = "Environment"
    value = "PoC Environment"
  }

  destination_url = "https://console.aws.amazon.com"
}


resource "britive_profile" "aws_systems_admin" {
  name                             = "AWS Systems Admin"
  description                      = "TF: Profile for AWS System Admins"
  app_container_id                 = data.britive_application.aws.id
  expiration_duration              = "90m0s"
  extendable                       = false
  notification_prior_to_expiration = "10m0s"
  extension_duration               = "12m30s"
  extension_limit                  = 2

  associations {
    type  = "Environment"
    value = "PoC Environment"
  }

  destination_url = "https://console.aws.amazon.com"
}

resource "britive_profile_permission" "aws_systems_admin" {
  profile_id = britive_profile.aws_systems_admin.id
  permission_name = "Poweruser-role"
  permission_type = "role"
}

resource "britive_profile_policy" "aws_systems_admin_policy" {
  profile_id  = britive_profile.aws_systems_admin.id
  policy_name = "AWS Systems Admin Policy"            # Replace with the actual policy name as needed
  members = jsonencode({
    tags = [
      {
        name = britive_tag.tenant_aws_systems_admins_tag.name
      }
    ]
  })
}

