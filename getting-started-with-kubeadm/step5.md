`kubectl run http --image=katacoda/docker-http-server:latest --replicas=1`{{execute HOST1}}

`kubectl get pods`{{execute HOST1}}

`docker ps | head -n2`{{execute HOST2}}
