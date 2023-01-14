####### Workspace Creation #########
resource "aws_grafana_workspace" "grafanaspace" {
  account_access_type      = var.account_access_type
  authentication_providers = var.authentication_providers
  permission_type          = var.permission_type
  role_arn                 = aws_iam_role.assume.arn
  data_sources = var.data_sources
  tags = {
    "Name" = var.grafanaworkspacename
  }
}

resource "aws_iam_role" "assume" {
  name = "grafana-assume-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "grafana.amazonaws.com"
        }
      },
    ]
  })
}


######### grafana role associate #######
/*resource "aws_grafana_role_association" "grafana-role" {
  role         = var.Role
  user_ids     = ["b438a438-7001-7017-f280-a06aa3af19ae"]
  workspace_id = aws_grafana_workspace.grafanaspace.id
}*/
resource "aws_grafana_workspace_api_key" "key" {
  key_name        = "admin"
  key_role        = var.Role
  seconds_to_live = 3600
  workspace_id    = aws_grafana_workspace.grafanaspace.id
}

resource "aws_grafana_workspace_saml_configuration" "example" {
  editor_role_values = ["admin"]
  idp_metadata_url   = var.idp_url
  workspace_id       = aws_grafana_workspace.grafanaspace.id
  role_assertion = "department"
  admin_role_values = ["admin"]
}

output "namespace" {
  value = aws_grafana_workspace.grafanaspace.name
  
}