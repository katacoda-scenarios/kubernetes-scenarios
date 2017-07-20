Once the Master has initialised, additional nodes can join the cluster as long as they have the correct token. The tokens can be managed via `kubeadm token`, for example `kubeadm token list`{{execute}}.

## Task

One the second node, run the command to join the cluster providing the IP address of the Master node.

`kubeadm join --token=102952.1a7dd4cc8d1f4cc5 [[HOST_IP]]:6443`{{execute HOST2}}

This is the same command provided after the Master has been initialised.
