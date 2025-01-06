Prerequisites
AWS Account: using my AWS account with appropriate IAM permissions to create resources like EC2, EKS, VPC, and security groups.
Jenkins Server: A running Jenkins instance for automating the pipeline tasks.
GitHub Repository: https://github.com/anil-elastiq/elastiq-take-home-assessment/blob/main/OpenSearch.md

Folder Structure
eks-opensearch-setup/
├── ec2_jenkins_server/
│   ├── install_software.sh
│   ├── main.tf
│   ├── outputs.tf
│   ├── provider.tf
│   ├── security_group.tf
│   ├── variables.tf
├── K8s-cluster/eks_cluster
│   ├── main.tf
│   ├── outputs.tf
│   ├── variables.tf
├── yamlfile-opensearch-operator/
│   ├── opensearch_cluster.yaml
│   ├── operator.yaml
├── roles/
│   ├── main.tf
│   ├── outputs.tf
│   ├── variables.tf
├── vpc/
│   ├── main.tf
│   ├── outputs.tf
│   ├── variables.tf
├── README.md

Steps for Setting Up the Infrastructure
1. Setting Up EC2 Instance jenkins server using terraform from my local (install terraform in my local)
cd .\ec2_instance\
-->terraform init
-->terraform plan
-->terraform apply -auto-approve

2. Install Required Software on EC2:
The install_software.sh script will install Docker, Jenkins, Terraform, AWS CLI, and kubectl on the EC2 instance.
Once your EC2 instance is provisioned, use this script to install the required tools.

3. Login jenking using ec2-machine ip with port 8080-->

-->Git Plugin
Purpose: Allows Jenkins to pull code from a Git repository.
Installation:
Go to Manage Jenkins > Manage Plugins > Available tab.
Search for "Git Plugin" and install it.

-->Terraform Plugin
Purpose: Provides Terraform integration within Jenkins to run Terraform commands from pipelines.
Installation:
Go to Manage Jenkins > Manage Plugins > Available tab.
Search for "Terraform" and install it.

-->AWS Credentials Plugin
Purpose: Allows Jenkins to securely store and access AWS credentials for AWS operations (EKS, EC2, etc.).
Installation:
Go to Manage Jenkins > Manage Plugins > Available tab.
Search for "AWS Credentials" and install it.
This is used to securely provide AWS credentials in the pipeline (as seen in AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY).

-->Kubernetes CLI Plugin (kubectl plugin)
Purpose: Allows Jenkins to interact with Kubernetes clusters using kubectl commands, useful for OpenSearch installation and management.
Installation:
Go to Manage Jenkins > Manage Plugins > Available tab.
Search for "Kubernetes CLI Plugin" and install it.

-->Credentials Binding Plugin
Purpose: Enables Jenkins to securely bind credentials (like AWS keys) to environment variables for pipeline usage.
Installation:
Go to Manage Jenkins > Manage Plugins > Available tab.
Search for "Credentials Binding Plugin" and install it.

-->Pipeline Plugin
Purpose: Enables Jenkins to work with pipelines defined in Jenkinsfile format (declarative or scripted pipelines).
Installation:
Go to Manage Jenkins > Manage Plugins > Available tab.
Search for "Pipeline Plugin" and install it.

-->Docker Pipeline Plugin (Optional)
Purpose: If you use Docker commands in your pipeline, this plugin helps integrate Docker with Jenkins.
Installation:
Go to Manage Jenkins > Manage Plugins > Available tab.
Search for "Docker Pipeline" and install it.

-->Pipeline Plugin
Purpose: Enables Jenkins to work with pipelines defined in Jenkinsfile format (declarative or scripted pipelines).
Installation:
Go to Manage Jenkins > Manage Plugins > Available tab.
Search for "Pipeline Plugin" and install it.

-->Docker Pipeline Plugin (Optional)
Purpose: of use use Docker commands in my  pipeline, this plugin helps integrate Docker with Jenkins.
Installation:
Go to Manage Jenkins > Manage Plugins > Available tab.
Search for "Docker Pipeline" and install it.

4. Configure AWS Credentials in Jenkins
Navigate to "Manage Jenkins" > "Manage Credentials" > "Global".
Add AWS credentials (Access Key ID and Secret Access Key) as AWS Credentials with a unique ID (e.g. aws-access-credentials).
and i Refer to these credentials in my  Jenkins pipeline as shown in the environment section above.


5. Jenkins Pipeline Setup
creating  Jenkins to automate the process of creating the EKS cluster, installing OpenSearch

-->Jenkins Pipeline for Creating EKS Cluster

-->Jenkins Pipeline for Installing OpenSearch

1. Clones the specified GitHub repository to pull the necessary files (operator.yaml and opensearch_cluster.yaml).
Setup Kubeconfig

2. Configures kubectl to use the context of the EKS cluster. Ensure we  have AWS CLI installed on the Jenkins machine with proper IAM permissions.
Apply OpenSearch Operator

3. Deploys the OpenSearch operator by applying the operator.yaml file.
Apply OpenSearch Cluster

4. Deploys the OpenSearch cluster using the opensearch_cluster.yaml file.
Validate OpenSearch Deployment

5. Retrieves the pods and services in the opensearch namespace to confirm that the deployment was successful.

-->Jenkins Pipeline for Cleanup and Destroying EKS Cluster