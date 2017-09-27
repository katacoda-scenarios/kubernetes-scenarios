The state of the two nodes in the cluster should now be Ready. This means that our deployments can be scheduled and launched.

Using Kubectl, it's possible to deploy pods. Commands are always issued for the Master with each node only responsible for executing the workloads.

The command below create a Pod based on the Docker Image _katacoda/docker-http-server_.

`kubectl run http --image=katacoda/docker-http-server:latest --replicas=1`{{execute HOST1}}

The status of the Pod creation can be viewed using `kubectl get pods`{{execute HOST1}}

Once running, you can see the Docker Container running on the node.

`docker ps | grep docker-http-server`{{execute HOST2}}
