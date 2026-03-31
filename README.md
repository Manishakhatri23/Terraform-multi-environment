

# Multi-Environment Infrastructure Design (Dev, Staging, Production) using Terraform Workspaces

## 📖 Project Overview  

This project implements a multi-environment infrastructure on AWS using Terraform Workspaces, allowing Development, Staging, and Production environments to be managed from a single Terraform codebase while keeping them isolated. This helps prevent conflicts and ensures that changes in one environment do not affect others.

The infrastructure is built using reusable Terraform modules to provision AWS resources such as VPC, EC2 instances, Security Groups, and S3 buckets. It follows Infrastructure as Code (IaC) best practices, ensuring consistency, scalability, and easier management across all environments.

---

## 🎯 Objectives

- Create separate environments (Dev, Staging, Production)  
- Ensure infrastructure isolation  
- Reuse Terraform code using modules  
- Manage environments using Terraform Workspaces

---

## 🏗️ System Architecture

![Architecture diagram](https://github.com/Manishakhatri23/Terraform-multi-environment/blob/main/Images/Architecture_diagram.png)

The following AWS resources are created:
- VPC (Virtual Private Cloud)  
- EC2 Instance  
- Security Groups  
- S3 Bucket (for storage & backend) 

---


## 📂 Project Structure

```bash

Terraform-multi-environment
│             
├── main.tf                    
├── terraform.tf               
├── variables.tf                 
│
├── modules                    
│   │
│   ├── vpc
│   │   ├── main.tf        
│   |   └── variables.tf 
|   |
│   ├── ec2
│   │   ├── main.tf         
│   |   └── variables.tf
|   |
│   └── s3
|       ├── main.tf 
│       └── variables.tf            
│
├── environments               
│   │
│   ├── dev.tfvars             
│   ├── staging.tfvars         
│   └── prod.tfvars            
│
├── Images                        
│   ├── Architecture_diagram.png
│   ├── modular_terraform_code.png
│   ├── dev_staging_prod_environment.png
│   ├── multi_environment_vpc.png
│   ├── multi_environment_s3_bucket.png
│   └── workspace_setup.png
│
└── README.md 

```

---

## 🧰Technologies Used
- Terraform
- Amazon Web Services (AWS)
- Terraform Workspaces
- Terraform Modules

---

## ⚙️ Terraform Implementation

### 🔹 Workspaces Used
- `dev`
- `staging`
- `prod`

Each workspace maintains separate state and infrastructure.

### 🔹 Modules
Reusable modules are created for:
- VPC
- EC2
- Security Groups
- S3

### 🔹 Backend Configuration
- Remote backend is configured using **S3 bucket**
- Ensures centralized and secure state management

---

## 🔄 Environment Differences

| Environment | Instance Type | Security |
|------------|--------------|----------|
| Dev        | Small        | Basic    |
| Staging    | Medium       | Moderate |
| Production | Large        | High + Extra Rules |

---

## 🚀 Deployment Steps

### Step 1: Initialize Terraform
```bash
terraform init
```
### Step 2: Create Workspaces

```bash
terraform workspace new dev
terraform workspace new staging
terraform workspace new prod
```
### Step 3: Switch workspace & Deploy Infrastructure for dev
```bash
terraform workspace select dev
terraform apply 
```
### Step 4: Switch workspace & Deploy Infrastructure for staging
```bash
terraform workspace select staging
terraform apply 
```

### step.4 Switch workspace & Deploy Infrastructure for production
```bash
terraform workspace select prod
terraform apply 
```
---

## 🔐 Security & Best Practices

### ✅ Lifecycle Rules
```hcl
lifecycle {
  prevent_destroy = true
}
```
### ✅ Environment-based tagging:
```hcl
tags = {
  Environment = terraform.workspace
}
```
---

## ✅ Validation & Testing
Successfully deployed all environments:
- Dev
- Staging
- Production
Verified:
- Resources are isolated
- Different configurations applied
- No interference between environments

---

## 📸 Project Outputs

### 1 Modular Terraform Code Structure

![Modular_terraform_code](https://github.com/Manishakhatri23/Terraform-multi-environment/blob/main/Images/modular_terraform_code.png)

### 2 Dev, Staging and Prod Environment setup

![Dev,staging,prod environment](https://github.com/Manishakhatri23/Terraform-multi-environment/blob/main/Images/dev_staging_prod_environment.png)

### 3 Multi Environment S3 Bucket

![s3_bucket](https://github.com/Manishakhatri23/Terraform-multi-environment/blob/main/Images/multi_environment_s3_bucket.png) 

### 4 Multi Environment VPC Setup

![vpc_setup](https://github.com/Manishakhatri23/Terraform-multi-environment/blob/main/Images/multi_environment_vpc.png) 

### 5 Terraform Workspace Setup

![Workspace_setup](https://github.com/Manishakhatri23/Terraform-multi-environment/blob/main/Images/workspace_setup.png) 

---

## 📊 Key Learnings
- Terraform Workspaces usage
- Infrastructure modularization
- Environment isolation
- Remote state management
- AWS resource provisioning using IaC

---

## 📌 Conclusion
This project showcases how Terraform Workspaces can be used to manage multiple AWS environments from a single codebase. By implementing modular infrastructure and environment isolation, the project ensures scalable, organized, and reliable infrastructure management following modern DevOps best practices.

---

## 👩‍💻 Author
Manisha Khatri

Aspiring Cloud & DevOps Engineer

🔗 GitHub: https://github.com/Manishakhatri23
