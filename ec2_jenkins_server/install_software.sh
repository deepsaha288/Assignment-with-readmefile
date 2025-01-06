#!/bin/bash

# Update package list and install dependencies
sudo apt update -y
sudo apt install -y curl wget apt-transport-https

# Install Docker (required for OpenSearch Operator)
sudo apt install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ubuntu
sudo systemctl restart docker
sudo chmod 777 /var/run/docker.sock


# Install Java 17
# Ref: https://www.rosehosting.com/blog/how-to-install-java-17-lts-on-ubuntu-20-04/
sudo apt update -y
sudo apt install openjdk-17-jdk openjdk-17-jre -y
java -version

# Install Jenkins
# Ref: https://www.jenkins.io/doc/book/installing/linux/#debianubuntu
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo \"deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/\" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install -y jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Get Jenkins initial login password
"ip=$(curl -s ifconfig.me)",
"pass=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)",

# Output
"echo 'Access Jenkins Server here --> http://'$ip':8080'",
"echo 'Jenkins Initial Password: '$pass''",

# Install kubectl
curl -LO "https://storage.googleapis.com/kubernetes-release/release/v1.21.0/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Install AWS CLI
curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Install Amazon EKS CLI
curl -o eksctl https://github.com/weaveworks/eksctl/releases/download/v0.43.0/eksctl_Linux_amd64
chmod +x eksctl
sudo mv eksctl /usr/local/bin/

# Install OpenSearch Kubernetes Operator
kubectl apply -f https://raw.githubusercontent.com/opensearch-project/operator/main/deploy/kubernetes/operator.yaml