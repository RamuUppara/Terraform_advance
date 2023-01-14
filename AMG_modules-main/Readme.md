REQUIREMENTS:
------------
* terraform
* aws

PROVIDERS:
---------
* aws

RESOURCES:
---------
* aws_grafana_workspace
* aws_iam_role
* aws_iam_policy
* aws_iam_policy_attachment
* aws_grafana_workspace_api_key

INPUTS:
------
* name   
* account_access_type
* authentication_providers
* permission_type
* Admin_permission

OUTPUTS:
-------
* workspace_endpoint
