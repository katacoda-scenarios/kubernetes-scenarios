`curl -L https://git.io/weave-kube-1.6 -o /opt/weave-kube`{{execute HOST1}}

`cat /opt/weave-kube`{{execute HOST1}}

`kubectl apply -f /opt/weave-kube`{{execute HOST1}}

`kubectl get pod -n kube-system`{{execute HOST1}}

https://kubernetes.io/docs/admin/addons/
