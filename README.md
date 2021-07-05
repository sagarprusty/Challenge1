# Automation of spinning up helloworld nodejs app along with monitoring setup with it
AutomationChallenge


## **Automated provisioning of Nodejs hello world app and Elastic Stack on K8S (Backed by Minikube in AWS)**

This repository covers automated provisioning of nodejs hello world and ElasticStack (*ElasticSearch/Filebeat/Kibana*) on Minikube. The setup includes provisoning an EC2 instance on AWS with Terraform and subsequently deploying *Docker, Minikube, kubectl, git, jq* inside the EC2 instance. CI/CD pipeline from jenkinsfile can then deploy nodejs app and ElasticStack on Minikube and run.



### **Pre-requisites:**
- *Git* should be installed on the local machine
- *Terraform* should be installed on the local machine
- AWS access-key/secret pair availability
- Execute terraform init, terraform plan , terraform apply (Not managing the state file, as its just quick challenge)
- Install java , jenkins to run the CI/CD pipeline
- Configure github weebhook to integrate with jenkins
- Install Docker,Kubectl,minikube

### Basic Workflow:

## Steps

**1) Clone the repository in your local machine(AWS Instance)**
```
git clone https://github.com/sagarprusty/Challenge1.git
```

**2) Provision an EC2 instance on Terraform**

**Note**: Before triggering terraform, you will have to customize variable values in `minikube-terraform/variables.tf` file. Please note that I've used my access key pair name and my cidr range. You will need to update with your equivalents to access the instance later.

Once you have all the values in place, please run:
```
cd minikube-terraform; terraform init; terraform plan; terraform apply;
```

This will start provisioning an EC2 instance with security group definition and corresponding ingress/egress rules

A cloud-init script is configured as part of EC2 instance creation. This takes care of setting up tools like:
- kubectl 
- Docker
- Minikube 
- Other system tools like jq, git etc.

After Terraform run completes:

The public dns endpoint / ip-address will allow access to the EC2 instance. 


**3) Setup Jenkins in local**

Configure github webhook with the push event to integrate github with jenkins.As soon as a github push occurs , jenkins immediately senses it and the CI/CD pipeline starts executing.



**4) Push code from local machine to the repository to enable pipeline execution and test**


Code push will trigger the Jenkins pipeline. Detailed steps can be seen in the console output screen.


**5) Access Nodejs helloworld app on local machine**
In order to run hello world app on local machine:

Check in browser using the url : https://public ip of esk8s-instance :31232

**6) Access Kibana on local machine**

In order to run Kibana on local machine:

Check in browser using the url : https://public ip of esk8s-instance :30722



Kibana dashboard can now be accessed on your local machine.


