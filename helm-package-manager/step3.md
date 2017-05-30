Use the _install_ command to deploy the chart to your cluster.

`helm install stable/redis`{{execute}}

Helm will now launch the required pods. You can view all packages using `helm ls`{{execute}}

If you receive an error that Helm _could not find a ready tiller pod_, it means that helm is still deploying. Wait a few moments for the tiller Docker Image to finish downloading.

In the next step we'll verify the deployment status.
