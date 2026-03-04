# Terraform Day 1 – Terraform Engine Fundamentals

This project demonstrates the basic working of Terraform including provider installation, Terraform lifecycle commands, and understanding the Terraform state file.

The goal of this exercise is to understand how Terraform interacts with cloud infrastructure and how it maintains infrastructure state.

---

## Tool Used

Terraform is used as the Infrastructure as Code tool for this project.

Terraform allows engineers to define and provision infrastructure using configuration files instead of manual cloud console operations.

---

## Project Structure

Day01-Terraform-Engine
│
├── provider.tf
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
│
├── terraform.tfstate
├── terraform.tfstate.backup
│
└── state-analysis
    ├── tfstate-notes.md
    └── graph-notes.md


---

## Terraform Lifecycle Commands

Terraform follows a standard workflow for infrastructure deployment.

### terraform init

Initializes the Terraform working directory.

Tasks performed:

- Downloads required providers
- Creates `.terraform` directory
- Creates `.terraform.lock.hcl`

---

### terraform plan

Previews infrastructure changes before they are applied.

Terraform compares:

Terraform configuration  
vs  
Terraform state file

Example output:

Plan: 1 to add, 0 to change, 0 to destroy

---

### terraform apply

Creates infrastructure defined in Terraform configuration.

In this project Terraform created:

- EC2 instance in AWS

After execution Terraform generated a state file called:

terraform.tfstate

---

### terraform destroy

Removes infrastructure created by Terraform.

This command ensures infrastructure can be safely cleaned up after testing.

---

## Terraform Provider

Terraform uses providers to interact with cloud platforms.

In this project the AWS provider is used.

Provider configuration is defined in:

provider.tf

During initialization Terraform downloads the provider plugin and stores it in:

.terraform/providers/

---

## Terraform Lock File

Terraform automatically creates a dependency lock file.

File:

.terraform.lock.hcl

Purpose:

- Locks provider versions
- Ensures consistent provider versions across team members
- Prevents unexpected provider upgrades

---

## Terraform State File

Terraform maintains infrastructure state in:

terraform.tfstate

The state file stores the mapping between Terraform resources and actual cloud infrastructure.

Example mapping:

aws_instance.app → EC2 instance

State file contains:

- resource IDs
- public and private IP addresses
- subnet information
- security group details
- EBS volume information

---

## Terraform State Backup

Terraform also creates a backup file:

terraform.tfstate.backup

Purpose:

- Backup of the previous state file
- Allows recovery in case the current state becomes corrupted

---

## Importance of Terraform State

Terraform relies heavily on the state file.

The state file allows Terraform to determine:

- what infrastructure already exists
- what needs to be created
- what needs to be destroyed

If the state file is deleted:

Terraform loses track of existing infrastructure and may attempt to recreate resources.

---

## Security Considerations

Terraform state files may contain sensitive information such as:

- infrastructure IDs
- network information
- credentials in some cases

Therefore state files should never be committed to Git repositories.

Production environments store state remotely using:

- S3 backend
- DynamoDB locking

---

## Key Learnings

From this exercise the following concepts were understood:

- Terraform lifecycle commands
- Provider installation process
- Terraform dependency lock file
- Terraform state file structure
- Mapping between Terraform resources and AWS infrastructure
- Importance of state management

---

## Experiment Conducted

Terraform lifecycle commands were executed multiple times:

terraform apply  
terraform destroy

Observations:

- EC2 instance ID changes after each apply
- Terraform state serial number increases
- Terraform updates infrastructure state accordingly

---

## Next Steps

Next phase of learning includes:

- Terraform variables
- terraform.tfvars files
- Terraform outputs
- Terraform locals
- count vs for_each concepts

