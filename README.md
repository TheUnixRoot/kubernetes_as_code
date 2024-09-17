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
    --directory-recurse
argocd app sync main
```

### Deployment test
```commandline
 kubectl port-forward deployment.apps/deployment-testweb 8040:80 -n context-test-1-ns
```


### Useful links
[Kubeseal and sealed-secrets](https://medium.com/@abdullah.devops.91/how-to-use-sealed-secrets-in-kubernetes-b6c69c84d1c2)

For using kubeseal, I did in WSL but cluster is managed with kubectl in windows so some line endings issues are found, to manage it I have to copy-paste contents throw different terminals instead of using <> and pipes.

```commandline
PS> kubectl.exe -n jenkins-ns get secret jenkins -o yaml > ./jenkins-secret.yml
$>./kubeseal --fetch-cert --controller-name sealed-secrets --controller-namespace sealed-secrets-ns > ./cert.crt
$> ./kubeseal --format yaml --cert ../../../c/Users/juanp/PycharmProjects/TeavaroProject/cert.crt
# Copy file content and press Ctrl+D to finish the stdin reading
# Copy the ouput sealed secret to a file manually from console output
```