# Terraform Graph Observation

The terraform graph command was executed to visualize Terraform's dependency graph.

Command used:

**terraform graph**

Output showed a single node:

**aws_instance.app**

This corresponds to the EC2 instance resource defined in main.tf.

Since the configuration only contained one resource, there were no additional dependencies in the graph.

Terraform will initialize the AWS provider and then create the EC2 instance.

Key Learning:
Terraform builds an internal dependency graph before applying infrastructure changes. This ensures resources are created in the correct order and allows Terraform to execute independent resources in parallel.

