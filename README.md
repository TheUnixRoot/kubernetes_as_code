# Kubernetes cluster management

Setups cluster, namespace and argocd and deploys prometheus + grafana over a simple redis service.

## Initital setup
```commandline
kubectl proxy --port=8080
```
Then apply terraform and it will create the context for test and download and install argocd within its own namespace.
```commandline
kubectl port-forward service/argocd-server 8090:80 -n argocd
```

For getting default admin password:
```commandline
PS> kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}"
$> echo "OUTPUT" | base64 -d
```
You can use same line but I don't use kubectl over WSL so I have to copy-paste it.

Using app of apps pattern:
```commandline
argocd app create main `
    --dest-namespace context-test-1-ns `
    --dest-server https://kubernetes.default.svc `
    --repo https://github.com/TheUnixRoot/kubernetes_as_code.git `
    --path argocd  
argocd app sync main
```

### Deployment test
```commandline
 kubectl port-forward deployment.apps/deployment-testweb 8040:80 -n context-test-1-ns
```