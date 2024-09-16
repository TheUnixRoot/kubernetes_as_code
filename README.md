# Kubernetes cluster management

Setups cluster, namespace and argocd and deploys prometheus + grafana over a simple redis service

## Initital setup
```commandline
kubectl proxy --port=8080
```
Then apply terraform and it will create the context for test and download and install argocd within its own namespace
