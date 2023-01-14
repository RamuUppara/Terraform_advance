variable "region" {
    type = string
    default = "us-east-1"
}
variable "profile" {
    type = string
    default = "default"
}

variable "name" {
    description = "The Grafana Workspace name"
    type = string
    default = "Iaac-amg-workspace"
}
variable "account_access_type" {
    type = string
    default = ""
}
variable "authentication_providers" {
    type = list(string)
    default = [ "" ]
}
variable "permission_type" {
    type = string
    default = ""
}
variable "Admin_permission" {
    type = string
    default = ""
}
variable "aws_iam_role_name" {
    type = string
    default = "Iaac-amg-workspace-role"
}
variable "aws_iam_policy_name" {
    type = string
    default = "AMGWorkspaceRole_MVP_policy"
}
variable "seconds_to_live" {
    type = number
    default = 3600
}

variable "account_id" {
    #type = list(string)
    #default = [ "" ]
}

############# Locals ############

locals {
    tags = {
        DataTaxonomy = "Cisco Operatoins Data"
        Deployment_stack = "green"
        #Deployment_version = v0.8
        Environment = "performance"
        Name = "Iaac-LACP-Mock-green-os"
        #OwnerName = ""
        #ResourceOwner = ""
        #Security Compliance = "yes"
        ServiceName        = "Security-stack"
        
    }
}