The Container Network Interface (CNI) defines how the different nodes and their workloads should communicate. There are multiple network providers available, some are listed [here](https://kubernetes.io/docs/admin/addons/).

## Task

In this scenario we'll use WeaveWorks. The deployment definition can be viewed at `cat /opt/weave-kube`{{execute HOST1}}

This can be deployed using `kubectl apply`.

`kubectl apply -f /opt/weave-kube`{{execute HOST1}}

Weave will now deploy as a series of Pods on the cluster. The status of this can be viewed using the command `kubectl get pod -n kube-system`{{execute HOST1}}

When installing Weave on your cluster, visit https://www.weave.works/docs/net/latest/kube-addon/ for details.
