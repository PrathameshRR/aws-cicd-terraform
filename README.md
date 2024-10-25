# AWS CI/CD Pipeline with Terraform

## Prerequisites

- AWS CLI installed and configured
- Terraform installed
- An AWS account with necessary permissions

## Setup Instructions

1. Clone this repository:
   ```
   git clone <repository-url>
   cd <repository-directory>
   ```

2. Initialize Terraform:
   ```
   terraform init
   ```

3. Review and modify the `variables.tf` file to set your desired values.

4. Plan the Terraform execution:
   ```
   terraform plan
   ```

5. Apply the Terraform configuration:
   ```
   terraform apply
   ```

6. After successful application, Terraform will output important information like the CodeCommit repository URL. Make note of these outputs.

7. Push your application code to the newly created CodeCommit repository.

8. The CI/CD pipeline will automatically trigger on new commits to the main branch.

## Important Files

- `buildspec.yml`: This file should be in your source code repository and contain the build instructions for CodeBuild.
- `appspec.yml`: This file should be in your source code repository and contain the deployment instructions for CodeDeploy.

## Cleaning Up

To avoid incurring future charges, remember to destroy the resources when you're done:
