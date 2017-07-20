The cluster has now been initialised. The Master node will manage the cluster, while our one worker node will run our container workloads.

## Task

To manage the Kubernetes cluster, the client configuration and certificates are required. This configuration is created when _kubeadm_ initialises the cluster. The command copies the configuration to the users home directory and sets the environment variable for use with the CLI.

```
sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf
```{{execute HOST1}}

The Kubernetes CLI, known as _kubectl_, can now use the configuration to access the cluster. For example, the command below will return the two nodes in our cluster.

`kubectl get nodes`{{execute HOST1}}

At this point, the Nodes may not be ready. This is because the Container Network Interface has not been deployed. This will be fixed within the next step.
