resource "aws_prometheus_workspace" "demo" {
  alias = var.promethusworkspacename

  tags = {
    Name = var.promethusworkspacename
  }
}