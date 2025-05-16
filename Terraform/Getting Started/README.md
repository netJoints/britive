# Britive Terraform - Getting Started Guide

This folder provides a basic starting point for automating Britive configurations using [Terraform](https://www.terraform.io/). It is designed to help you quickly get up and running with minimal configuration.

## 🚀 What’s Included

This example is designed to demonstrate how to connect to your Britive tenant using Terraform. From here, you can build more advanced configurations and modules based on your organization's needs.

## ✅ Minimum Requirements

To make this example work, you only need **two files**:

1. `main.tf` - Contains the base Terraform configuration.
2. `terraform.tfvars` - Stores your **Britive tenant name** and **API token**.

## `terraform.tfvars` Example

```hcl
tenant = "your-tenant-name"
token  = "your-api-token"
'''

## ⚠️ Do NOT upload your terraform.tfvars file to GitHub or share it publicly.
This file contains sensitive credentials and should be securely stored in your local environment or a secrets management system.

## 🧪 How to Use
	1.	Clone the repo or copy the Getting Started folder.
	2.	Create a terraform.tfvars file with your Britive tenant and token.
	3.	Initialize Terraform:




terraform init


	4.	Run the plan and apply:


terraform plan
terraform apply


### 🧱 Build on Top of It

Once you’re connected and authenticated, you can start building additional Terraform resources to manage roles, permissions, JIT access, and more in your Britive environment. Use this as your foundation and expand your infrastructure as code.



Getting Started/
├── main.tf
└── terraform.tfvars    <-- Keep this private!

