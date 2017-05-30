Helm deploys all the pods, replication controllers and services. The pod will be in a _pending_ state while the Docker Image is downloaded. Once complete it will move into a _running_ state. You'll now have a Redis Cluster running on top of Kubernetes.

Use _kubectl_ to find out what was deployed.

`kubectl get pods`{{execute}}

`kubectl get rc`{{execute}}

`kubectl get svc`{{execute}}
