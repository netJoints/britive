# Britive Terraform - Getting Started

This folder provides a basic starting point for automating Britive configurations using [Terraform](https://www.terraform.io/). It is designed to help you quickly get up and running with minimal configuration.

## 🚀 What’s Included

This example is designed to demonstrate how to connect to your Britive tenant using Terraform. From here, you can build more advanced configurations and modules based on your organization's needs.

## ✅ Minimum Requirements

To make this example work, you only need **two files**:

1. `main.tf` - Contains the base Terraform configuration.
2. `terraform.tfvars` - Stores your **Britive tenant name** and **API token**.

### `terraform.tfvars` example

```hcl
tenant = "your-tenant-name"
token  = "your-api-token"
