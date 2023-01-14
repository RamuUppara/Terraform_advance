variable "region" {
    default = "us-east-1"
}

variable "userName" {
    type = string
}
variable "promethusworkspacename" {
  type = string
}
variable "grafanaworkspacename" {
  type = string
}

variable "account_access_type" {
  type        = string
  default     = "CURRENT_ACCOUNT"
}

variable "authentication_providers" {
  type        = list(string)
  default     = ["SAML"]
}

variable "permission_type" {
  type        = string
  default     = "CUSTOMER_MANAGED"
}

variable "Role" {
  type        = string
  default     = "ADMIN"
}
variable "data_sources" {
  type        = list(string)
  default     = []
}
variable "idp_url" {
    type = string
}
