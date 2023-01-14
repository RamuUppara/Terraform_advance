module "Grafana" {
    source = "./AMG"
    name = var.name
    account_id = var.account_id
    account_access_type = var.account_access_type
    authentication_providers = var.authentication_providers
    permission_type = var.permission_type
    Admin_permission = var.Admin_permission
    #tags = local.tags
}
