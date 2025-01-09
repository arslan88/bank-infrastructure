# Bank Infrastructure Setup
This project sets up the initial cloud infrastructure for a new bank business using Azure and Terraform. The infrastructure includes a React web app, backend services, and necessary network configurations. The setup also includes automated testing using Terratest.
# Table of Contents
- Introduction
- Prerequisites
- Project Structure
- Setup Instructions
- Running the Solution
- Automated Testing
- Improvements
# Introduction
This project provides the infrastructure setup for a new bank business using Azure as the cloud platform. The infrastructure is defined using Terraform and includes a CI/CD pipeline for automated deployment. The setup includes:
- A React web app deployed as a Single Page Application.
- Two backend services with their own databases.
- Network configurations including Virtual Network and Subnets.
- Network Security Groups to control outbound traffic.
- Azure API Management for rate limiting.
# Prerequisites
- Terraform (version 1.5.2 or later)
- Azure CLI
- Go (for automated testing)
- Git

  # Project Structure

```
   bank-infra/
├── main.tf                # Main Terraform file
├── variables.tf           # Input variables
├── outputs.tf             # Outputs
├── modules/
│   ├── network/
│   │   ├── main.tf        # VNet and Subnets
│   │   ├── variables.tf   # Input variables for network
│   │   ├── outputs.tf     # Outputs for network module
│   ├── backend_service/
│   │   ├── main.tf        # Backend service setup
│   │   ├── variables.tf   # Input variables for backend services
│   │   ├── outputs.tf     # Outputs for backend services
│   ├── react_app/
│   │   ├── main.tf        # React app infrastructure
│   │   ├── variables.tf   # Input variables for React app
│   │   ├── outputs.tf     # Outputs for React app
└── .github/
    ├── workflows/
        └── terraform.yml  # CI/CD Pipeline
test/
    └── main_test.go       # Automated tests using Terratest
```



# Setup Instructions
## Clone the Repository:
```
git clone https://github.com/arslan88/bank-infrastructure.git
cd bank-infra
```


## Initialize Terraform:
```
terraform init
```


## Create a Terraform Plan:
```
terraform plan
```


## Apply the Terraform Plan:
```
terraform apply -auto-approve
```

 # Running the Solution
- Deploy the Infrastructure: Follow the setup instructions to deploy the infrastructure using Terraform.
- CI/CD Pipeline: The CI/CD pipeline is defined in .github/workflows/terraform.yml. It automates the deployment process using GitHub Actions. The pipeline includes steps for initializing, planning, and applying Terraform configurations.

# Automated Testing
Automated tests are included to ensure that the infrastructure is set up correctly. The tests are written using Terratest and can be found in the test directory.

## Running the Tests
Install Go and Terratest: Ensure you have Go installed and install Terratest by running:
```
go get github.com/gruntwork-io/terratest/modules/terraform
```
Run the Tests: Navigate to the test directory and run the tests using:
```
go test -v
```




