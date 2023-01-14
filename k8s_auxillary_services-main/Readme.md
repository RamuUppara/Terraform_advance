Installation steps for k8s Auxillary services
-----------------------------------------------

* install kubectl cli in local manchine
* create required name space for services in k8s using `terraform kubernetes provider`
* install services using `helm charts`
  1. use  `terraform helm provider`
  2. use `helm chart url` in repository arguments