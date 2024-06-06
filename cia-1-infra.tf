### GitHub Repo(s)

resource "github_repository" "cia-demo-infra" {
  name        = "cia-1-demo-infra"
  description = "Home of the cia-demo-infra"
  visibility = "public"
  auto_init = true
}

#### Terraform Workspace(es) and Variables

resource "tfe_workspace" "cia-demo-infra" {
  name         = "cia-1-demo-infra"
  organization = var.tfc_org
  tag_names    = ["demo", "infra"]
  vcs_repo {
    identifier = github_repository.cia-demo-infra.full_name
    oauth_token_id = var.oauth_token_id
  }
  allow_destroy_plan = true
  auto_apply = true
  global_remote_state = true 
  queue_all_runs = false  
  terraform_version = "1.8.5" 
}

# resource "tfe_variable" "aws_region" {
#   key          = "aws_region"
#   value        = EU-WEST-1
#   category     = "terraform"
#   workspace_id = tfe_workspace.cia-demo-infra.id
#   description  = "AWS Region to be used"
# }

