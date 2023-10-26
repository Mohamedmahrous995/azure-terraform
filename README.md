# Azure Infrastructure with Terraform

This repository contains Terraform code to provision Azure resources, including an Azure Resource Group, Azure Container Registry, Azure App Service Plan, and two Azure App Services.

## Prerequisites

Before you begin, ensure you have the following:

1. [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
2. Azure credentials configured. You can set them as environment variables or use Azure CLI to log in.
3. Replace the placeholders in the `variables.tf` file with your specific configuration.

## Usage

1. Clone this repository to your local machine:

   ```bash
   git clone <repository_url>
   cd <repository_directory>
1. Initialize Terraform:

terraform init

2. Review the configuration in the .tf files and customize them as needed.

3. Plan the infrastructure to ensure the changes are as expected:
terraform plan

4. Apply the changes to create Azure resources:

terraform apply

Configuration
Make sure to update the variables.tf file with your specific configuration, including resource names, locations, and environment variables for the App Services.

Resources Created
Azure Resource Group
Azure Container Registry
Azure App Service Plan
Two Azure App Services (Linux)


Replace `<repository_url>` and `<repository_directory>` with the appropriate values for your repository URL and directory where you cloned this code.

This README provides an overview of the repository, prerequisites, usage instructions, configuration customization, and information about the resources created. Make sure to include this README in your repository to help users understand and work with your Terraform configuration.
