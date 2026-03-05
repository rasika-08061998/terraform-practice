locals {
  project_name = "Variables-Output"
  environment  = "dev"
  owner        = "Rasika"
  common_tags = {
    Project     = local.project_name
    Environment = local.environment
    Owner       = local.owner
  }
}
