`kubectl create clusterrolebinding permissive-binding --clusterrole=cluster-admin --user=admin --user=kubelet --group=system:serviceaccounts;`{{execute HOST1}}

`kubectl apply -f dashboard.yaml`{{execute HOST1}}

`kubectl get pods -n kube-system`{{execute HOST1}}

https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/
