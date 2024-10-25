# AWS CI/CD Pipeline with Terraform and LocalStack

## Setup Instructions

1. Create and activate a virtual environment:
   ```
   python -m venv venv
   source venv/bin/activate  # On Windows use `venv\Scripts\activate`
   ```

2. Install required packages:
   ```
   pip install awscli-local localstack
   ```

3. Start LocalStack:
   ```
   SERVICES=s3,iam,codecommit,codebuild,codepipeline localstack start
   ```

4. Set up your AWS CLI to work with LocalStack:
   ```
   export AWS_ACCESS_KEY_ID=test
   export AWS_SECRET_ACCESS_KEY=test
   export AWS_DEFAULT_REGION=us-east-1
   ```

5. Ensure you have a `buildspec.yml` file in your source repository with the necessary build commands.

6. Run `terraform init` and `terraform apply` to create the infrastructure in LocalStack.

## Important Files

- `buildspec.yml`: This file should be in your source code repository and contain the build instructions for CodeBuild.

## Notes

- This setup is for local development and testing purposes using LocalStack.
- Some AWS features may not be fully supported or may behave differently in LocalStack.
- Remember to deactivate the virtual environment when you're done:
  ```
  deactivate
  ```
