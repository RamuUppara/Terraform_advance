variable "region" {
    type = string
    default = "us-east-1"
}
variable "profile" {
    type = string
    default = "default"
}
variable "name" {
    type = string
    default = ""
}
variable "account_id" {
    #type = list(string)
    #default = [""]
}
variable "account_access_type" {
    type = string
    default = ""
}
variable "authentication_providers" {
    type = list(string)
    default = [""]
}
variable "permission_type" {
    type = string
    default = ""
}
variable "Admin_permission" {
    type = string
    default = ""
  
}