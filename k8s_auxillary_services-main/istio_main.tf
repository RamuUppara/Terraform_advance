data "aws_eks_cluster" "example" {
  name = "iaac-eks-dev"
}
data "aws_eks_cluster_auth" "main" {
  name = "iaac-eks-dev"
}

resource "null_resource" "kube-config" {
  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --region us-west-1 --name iaac-eks-dev"
  }
}

resource "kubectl_manifest" "namespace" {
  yaml_body = <<YAML
apiVersion: v1
kind: Namespace
metadata:
  name: istio-system
YAML
  depends_on = [
    null_resource.kube-config
  ]
}

resource "helm_release" "istio-base" {
  chart            = "base"
  namespace        = "istio-system"
  create_namespace = true
  name             = "istio-base"
  version          = "1.12.6"
  repository       = "https://istio-release.storage.googleapis.com/charts"
  force_update     = false
  recreate_pods    = false

  /*values = [
    yamlencode(var.istio_base_settings)
  ]*/
}