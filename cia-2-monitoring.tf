### GitHub Repo(s)


resource "github_repository" "cia-demo-monitoring" {
  name        = "cia-2-demo-monitoring"
  description = "Home of the cia-demo-monitoring"
  visibility = "public"
  auto_init = true
}

#### Terraform Workspace(es) and Variables

resource "tfe_workspace" "cia-demo-monitoring" {
  name         = "cia-2-demo-monitoring"
  organization = var.tfc_org
  tag_names    = ["demo", "monitoring"]
  vcs_repo {
    identifier = github_repository.cia-demo-monitoring.full_name
    oauth_token_id = var.oauth_token_id
  }
  allow_destroy_plan = true
  auto_apply = true
  global_remote_state = true 
  queue_all_runs = false  
  terraform_version = "1.9.0" 
}

