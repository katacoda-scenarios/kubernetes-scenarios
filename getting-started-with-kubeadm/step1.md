Kubeadm has been installed on the nodes. Packages are available for Ubuntu 16.04+, CentOS 7 or HypriotOS v1.0.1+.

The first stage of initialising the cluster is to launch the master node. The master is responsible for running the control plane components, etcd and the API server. Clients will communicate to the API to schedule workloads and manage the state of the cluster.

## Task

The command below will initialise the cluster with a known token to simplify the following steps.

`kubeadm init --token=102952.1a7dd4cc8d1f4cc5`{{execute HOST1}}

In production, it's recommend to exclude the token causing kubeadm to generate one on your behalf.
