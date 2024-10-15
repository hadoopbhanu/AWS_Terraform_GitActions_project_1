
# **Infrastructure Provisioning CI CD with Terraform & GitHub Actions 🚀**

This project demonstrates how to **provision cloud infrastructure** using **Terraform** and automate the deployment pipeline with **GitHub Actions**. It highlights modern **Infrastructure as Code (IaC)** practices, showcasing automated deployment workflows, ideal for **Cloud, DevOps, or Infrastructure Engineering** roles.

---

## **Project Overview**

In this project, we:
1. **Set up Terraform**: Installed and configured Terraform locally for infrastructure provisioning.
2. **Wrote Terraform Code**: Defined infrastructure resources such as **networks, subnets, security groups, and VPCs**, following best practices.
3. **Initialized and Applied Terraform**: Deployed the infrastructure by applying Terraform configuration.
4. **Configured GitHub Repository**: Hosted the Terraform code in GitHub, including setup of **`.gitignore`** and README.
5. **Integrated GitHub Actions**: Automated infrastructure deployment with CI/CD workflows triggered by code pushes.
6. **Pushed Code to GitHub**: Managed infrastructure changes via **branch-based workflows**.
7. **Monitored and Verified**: Monitored deployment progress and verified successful infrastructure creation using **GitHub Actions logs**.

---

## **Key Technologies & Tools Used**

- **Terraform**: For Infrastructure as Code (IaC) to provision cloud resources.
- **GitHub Actions**: For automating deployment workflows with CI/CD.
- **Cloud Provider**: (AWS/GCP/Azure) – Provisioning example infrastructure including VPCs, subnets, and EC2 instances.
- **Security Groups Module**: Managed firewall rules to control traffic into and out of infrastructure resources.
- **YAML Workflow Configuration**: Defined CI/CD pipelines for automated deployments.
- **Git**: For version control of the Terraform codebase.

---

## **Project Structure**

AWS_Terraform_GitActions_project_1/
│
├── .github/
│   └── workflows/
│       └── deploy.yml         # GitHub Actions workflow for deployment automation
│
├── terraform-webapp/
│   ├── main.tf                # Main Terraform code
│   ├── variables.tf           # Variable definitions for infrastructure
│   ├── terraform.tfvars       # Variable values for infrastructure resources
│   └── modules/
│       ├── ALB/               # Module for Application Load Balancer
│       ├── EC2/               # Module for EC2 instance management
│       ├── SG/                # Module for Security Groups
│       └── VPC/               # Module for VPC resources
├── .gitignore                 # Files and folders to ignore
├── README.md                  # Project documentation (this file)
└── terraform.tfstate          # Local Terraform state file

---

## **How to Run Locally**

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/<your-username>/AWS_Terraform_GitActions_project_1.git
   cd AWS_Terraform_GitActions_project_1
   ```

2. **Initialize Terraform:**
   ```bash
   terraform init
   ```

3. **Plan and Apply Changes:**
   ```bash
   terraform plan
   terraform apply --auto-approve
   ```

4. **Monitor GitHub Actions Workflow:**
   - Push your changes to GitHub:
     ```bash
     git add .
     git commit -m "Initial commit"
     git push origin main
     ```
   - Visit the **GitHub Actions tab** to monitor the workflow and verify deployment progress.

---

## **GitHub Actions Workflow Configuration**

```yaml
name: Terraform CICD pipeline for infra provisioning
on:
  push:
    branches:
      - main

jobs:
  build-infra:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v2

      - name: Terraform Init
        run: terraform init

      - name: Terraform Plan
        run: terraform plan

      - name: Terraform Apply
        run: terraform apply --auto-approve
```

---

## **Future Improvements**

- Add **Terraform state backend** for remote state management.
- Integrate **dynamic secrets management** using GitHub Actions.
- Extend the project with **Cloud Monitoring and Alerting** tools (e.g., Prometheus, Grafana).

---

## **Conclusion**

This project demonstrates a complete **infrastructure automation workflow**, from writing Terraform code to deploying and verifying resources with **CI/CD pipelines** using GitHub Actions. It reflects practical knowledge in managing **IaC** and automating deployments, making it an excellent addition to your **DevOps portfolio**.

---

Author
Bhanu Koduri
