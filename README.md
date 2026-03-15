# Project TerraCore: Automated Secure Cloud Infrastructure ☁️

## 📌 Project Overview

Project TerraCore is an Infrastructure as Code (IaC) project built using Terraform. It automatically provisions a secure, highly available, and scalable 3-tier Virtual Private Cloud (VPC) architecture on AWS (ap-south-1 region).

## 🎥 Proof of Work (Live Demo)

**[Watch the AWS Console Architecture Demo Here] ->** _(Yahan apna Google Drive/YouTube video ka link paste karna)_

## 🏗️ Architecture Design

This project provisions the following AWS resources:

- **Custom VPC** (CIDR: 10.0.0.0/16)
- **Public Subnet** (For internet-facing resources like Load Balancers)
- **Private Subnet** (For secure backend resources/databases)
- **Internet Gateway (IGW)** (Provides internet access to the public subnet)
- **NAT Gateway** (Provides secure, outbound-only internet access to the private subnet)
- **Public & Private Route Tables** (For traffic routing and network isolation)

## 🛠️ Technology Stack

- **Cloud Provider:** Amazon Web Services (AWS)
- **Infrastructure as Code:** Terraform
- **Networking:** VPC, Subnets, IGW, NAT Gateway, Elastic IP

## 🚀 How to Run the Code

If you want to deploy this infrastructure in your own AWS account, follow these steps:

1. Clone this repository:

```bash

git clone [https://github.com/komalgaur992/Project-TerraCore.git]
(https://github.com/komalgaur992/Project-TerraCore.git)

```

2. Initialize Terraform to download the AWS provider:

```bash
terraform init

```

3. Preview the infrastructure changes:

```bash
terraform plan

```

4. Deploy the infrastructure:

```bash
terraform apply -auto-approve

```

5. Clean up: To avoid AWS charges, destroy the resources once you are done:

```bash
terraform destroy -auto-approve

```
