**Day 1 – Terraform Engine & State Learning Notes**

Objective :
Understand how the Terraform engine works internally, including the lifecycle commands, provider installation, and the Terraform state file.

1. **Terraform Lifecycle**
Terraform follows a standard workflow:
terraform init
terraform plan
terraform apply
terraform destroy
terraform init

**Purpose**:
-> Initializes the working directory
-> Downloads required providers
-> Creates .terraform directory
-> Generates .terraform.lock.hcl

**Observed behavior:**
-> AWS provider downloaded from registry
-> provider stored inside .terraform/providers

**terraform plan**
Purpose:
Compares Terraform configuration vs current state
Shows infrastructure changes before applying

Observation:
Since the state file did not exist initially, Terraform planned to create the EC2 instance.

Example output observed:
Plan: 1 to add, 0 to change, 0 to destroy

**terraform apply**

Purpose:
Applies the execution plan
Creates infrastructure in AWS

Observation:
EC2 instance was created
Terraform generated a terraform.tfstate file
State file contained resource mapping

**terraform destroy**

Purpose:
Deletes resources defined in Terraform configuration

Observation:
EC2 instance terminated
State updated accordingly

2. **Terraform Provider**

Terraform communicates with cloud APIs using providers.
In this project the provider used was:
AWS provider.

Configuration defined in:
provider.tf

During terraform init, Terraform downloaded the provider binary and stored it in:
.terraform/providers/

3.** Terraform Dependency Lock File**
File created:
.terraform.lock.hcl

Purpose:
Locks the exact provider version used
Ensures all developers use the same provider version
Prevents unexpected provider upgrades

Observation:
AWS provider version installed was 5.x.x.

This version is determined by the version constraint in provider.tf.

4.** Terraform State File**

Terraform created:
terraform.tfstate

Purpose:
The state file stores the mapping between Terraform configuration and real infrastructure.

Important observation:
aws_instance.app → EC2 instance ID

Example from state:
"id": "i-092f582ee6a2268db"

This allows Terraform to track existing resources.

5. **State File Structure**

Key fields observed:
version
State file format version.
terraform_version
Terraform version used to create the state.
serial
State revision number.

Observation:
Serial number increased every time Terraform applied changes.

Example:

apply → serial 1
destroy → serial 2
apply → serial 3
lineage

Unique identifier for the infrastructure state.
Helps Terraform track state history.

resources
Contains all infrastructure resources managed by Terraform.

Example observed:
aws_instance.app

Attributes stored include:
instance ID
public IP
private IP
subnet ID
security group
EBS volume information

6.** Terraform State Backup**
Terraform also created:
terraform.tfstate.backup

Purpose:
Backup of the previous state before any modification.
Used for recovery if the current state becomes corrupted.

7. **Importance of the State File**

Terraform relies on the state file to determine:

what infrastructure already exists
what needs to be created
what needs to be destroyed

If the state file is deleted:

Terraform assumes no infrastructure exists
It may try to recreate resources
This can lead to duplicate infrastructure

8. **Security Consideration**

State files can contain sensitive information such as:

instance IDs
IP addresses
resource ARNs
credentials (in some cases)

Therefore state files should never be committed to Git repositories.

Instead production systems store state remotely using:

S3 backend
DynamoDB locking

This will be implemented later in the roadmap.

9. **Key Learnings from Day 1**

Key concepts understood:

Terraform lifecycle commands
Provider installation
Dependency lock file
Terraform state file structure
Infrastructure mapping between Terraform and AWS
Importance of remote state management

10. **Experiment Performed**

Lifecycle executed multiple times:
terraform apply
terraform destroy

**Observation**:

EC2 instance ID changed after each apply
State serial number increased
State file updated accordingly
