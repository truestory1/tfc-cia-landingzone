### GitHub Repo(s)

resource "github_repository" "cia-demo-application" {
  name        = "cia-3-demo-application"
  description = "Home of the cia-demo-application"
  visibility = "public"
  auto_init = true
}

#### Terraform Workspace(es) and Variables

resource "tfe_workspace" "cia-demo-application" {
  name         = "cia-3-demo-application"
  organization = var.tfc_org
  tag_names    = ["demo", "application"]
  vcs_repo {
    identifier = github_repository.cia-demo-application.full_name
    oauth_token_id = var.oauth_token_id
  }
  allow_destroy_plan = true
  auto_apply = true
  global_remote_state = true 
  queue_all_runs = false  
  terraform_version = "1.2.9" 
}


// add infra Variables 
// secrets from variables.csv