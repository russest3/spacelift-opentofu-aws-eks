# spacelift-opentofu-aws-eks

Install OpenTofu on Ubuntu
- Use snap in Ubuntu


```
python -m venv .venv
source .venv/bin/activate
opentofu.tofu init
opentofu.tofu apply

aws eks update-kubeconfig --region us-east-2 --name <cluster_name>
kubectl get nodes
```