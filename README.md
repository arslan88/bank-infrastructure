# Handelsbanken-DevOps-Infrastructure
This project sets up the initial cloud infrastructure for a new bank business using Azure and Terraform.

## Setup

Follow these steps to set up the project locally:

Clone the repository:
   ```bash
   git clone https://github.com/arslan88/bank-infrastructure.git
   cd bank-infrastructure



Create a new branch for your work:
git checkout -b initial-setup


Navigate to the terraform directory and initialize Terraform:
cd terraform
terraform init


Apply the Terraform configuration:
terraform apply



## CI/CD Pipeline

The CI/CD pipeline is set up using GitHub Actions. It will automatically deploy the infrastructure when changes are pushed to the `main` branch.

The workflow file is located at `.github/workflows/deploy.yml` and includes the following steps:
- Checkout code
- Set up Terraform
- Initialize Terraform
- Apply Terraform configuration





