####### Workspace Creation #########
resource "aws_grafana_workspace" "grafanaspace" {
  name = var.name
  account_access_type      = var.account_access_type
  authentication_providers = var.authentication_providers
  permission_type          = var.permission_type
  role_arn                 = aws_iam_role.AMGWorkspaceRole_MVP.arn
  tags = local.tags
}

### Cross account iam role ######
resource "aws_iam_role" "AMGWorkspaceRole_MVP" {
  name = var.aws_iam_role_name
  assume_role_policy = "${file("role.tpl")}"
  tags = local.tags
}
### policy creation ####
/*data "template_file" "iam-policy-template" {
    template = "${file("demo.tpl")}"

    vars = {
        account = var.account_id
    }
}*/

resource "aws_iam_policy" "AMGWorkspaceRole_MVP_policy" {
  name        = var.aws_iam_policy_name
  #policy = "${file("demo.tpl")}"
  #policy = data.template_file.iam-policy-template.rendered
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "VisualEditor0",
        Action = "sts:AssumeRole",
        Effect   = "Allow",
        Resource = [
          "arn:aws:iam::${var.account_id[0]}:role/AMGCloudWatchDataSourceRole",
          "arn:aws:iam::${var.account_id[1]}:role/AMGPrometheusDataSourceRole",
          "arn:aws:iam::${var.account_id[2]}:role/AMGCloudWatchDataSourceRole",
          "arn:aws:iam::${var.account_id[3]}:role/AMGPrometheusDataSourceRole",
          "arn:aws:iam::${var.account_id[4]}:role/AMGCloudWatchDataSourceRole",
          "arn:aws:iam::${var.account_id[5]}:role/AMGPrometheusDataSourceRole",
          "arn:aws:iam::${var.account_id[6]}:role/AMGCloudWatchDataSourceRole"
        ]
      },
    ]
  })
  tags = local.tags
}

#### policy attachment ###
resource "aws_iam_policy_attachment" "AMGWorkspaceRole_MVP_policyattachment" {
  name       = "AMGWorkspaceRole_MVP_policyattachment"
  roles      = [aws_iam_role.AMGWorkspaceRole_MVP.name]
  policy_arn = aws_iam_policy.AMGWorkspaceRole_MVP_policy.arn
}


resource "aws_grafana_workspace_api_key" "key" {
  key_name        = "admin"
  key_role        = var.Admin_permission
  seconds_to_live = var.seconds_to_live
  workspace_id    = aws_grafana_workspace.grafanaspace.id
}

output "namespace" {
  value = aws_grafana_workspace.grafanaspace.name
  
}