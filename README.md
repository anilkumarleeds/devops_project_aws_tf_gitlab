
GitLab CI/CD Configuration for CI/CD Pipeline
This repository contains GitLab CI/CD configuration files for automating the build, plan, and deployment processes using GitLab CI/CD pipelines.

Stages
The GitLab CI/CD pipeline consists of the following stages:

Build: This stage builds a Docker image for the application and pushes it to Docker Hub.
Plan: This stage executes Terraform commands to create an execution plan for infrastructure changes.
Deploy: This stage deploys infrastructure changes to the AWS environment using Terraform.
Environment Setup
The GitLab CI/CD pipeline uses specific Docker images and environment variables for execution.

Docker Image: The pipeline uses the hashicorp/terraform:light Docker image for executing Terraform commands.
Environment Variables:
DOCKER_IMAGE_NAME: The name of the Docker image for the application.
IMAGE_TAG: The tag for the Docker image.
TF_CLI_ARGS: Additional arguments for Terraform CLI.
TF_LOG: Terraform logging level.
Job Definitions
The GitLab CI/CD pipeline defines the following jobs:

Build Image: This job builds a Docker image for the application, tags it with the specified tag, and pushes it to Docker Hub.
Terraform Infrastructure Plan: This job executes Terraform commands to create an execution plan for infrastructure changes.
Terraform Deployment: This job deploys infrastructure changes to the AWS environment using Terraform.
How to Use
To use this GitLab CI/CD configuration in your project, follow these steps:

Ensure that you have configured your GitLab project to use GitLab CI/CD.
Copy the provided .gitlab-ci.yml file to the root of your project repository.
Customize the environment variables (DOCKER_IMAGE_NAME, IMAGE_TAG, TF_CLI_ARGS, TF_LOG) and job scripts according to your project requirements.
Commit and push the changes to your GitLab repository.
GitLab CI/CD will automatically trigger the pipeline execution based on the defined stages and job configurations.
Note
The jobs in the pipeline are configured to run manually (when: manual). You need to manually trigger the jobs in the GitLab UI or using GitLab API.
Make sure to configure GitLab CI/CD secret variables (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, DOCKERHUB_ACCESS_TOKEN, DOCKERHUB_USERNAME) for securely storing sensitive information required for job execution.