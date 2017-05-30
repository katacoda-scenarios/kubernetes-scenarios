Helm is a single binary that manages deploying Charts to Kubernetes. A chart is a packaged unit of kubernetes software. It can be downloaded from https://github.com/kubernetes/helm/releases

`curl -LO https://storage.googleapis.com/kubernetes-helm/helm-v2.3.0-linux-amd64.tar.gz
tar -xvf helm-v2.3.0-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/`{{execute}}


Once installed, initialise update the local cache to sync the latest available packages with the environment.

`helm init
helm repo update`{{execute}}
