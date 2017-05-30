echo 'apiVersion: v1' >> ~/skydns-rc.yaml
echo 'kind: ReplicationController' >> ~/skydns-rc.yaml
echo 'metadata:' >> ~/skydns-rc.yaml
echo '  name: kube-dns-v9' >> ~/skydns-rc.yaml
echo '  namespace: kube-system' >> ~/skydns-rc.yaml
echo '  labels:' >> ~/skydns-rc.yaml
echo '    k8s-app: kube-dns' >> ~/skydns-rc.yaml
echo '    version: v9' >> ~/skydns-rc.yaml
echo '    kubernetes.io/cluster-service: "true"' >> ~/skydns-rc.yaml
echo 'spec:' >> ~/skydns-rc.yaml
echo '  replicas: 1' >> ~/skydns-rc.yaml
echo '  selector:' >> ~/skydns-rc.yaml
echo '    k8s-app: kube-dns' >> ~/skydns-rc.yaml
echo '    version: v9' >> ~/skydns-rc.yaml
echo '  template:' >> ~/skydns-rc.yaml
echo '    metadata:' >> ~/skydns-rc.yaml
echo '      labels:' >> ~/skydns-rc.yaml
echo '        k8s-app: kube-dns' >> ~/skydns-rc.yaml
echo '        version: v9' >> ~/skydns-rc.yaml
echo '        kubernetes.io/cluster-service: "true"' >> ~/skydns-rc.yaml
echo '    spec:' >> ~/skydns-rc.yaml
echo '      containers:' >> ~/skydns-rc.yaml
echo '      - name: etcd' >> ~/skydns-rc.yaml
echo '        image: gcr.io/google_containers/etcd:2.2.1' >> ~/skydns-rc.yaml
echo '        resources:' >> ~/skydns-rc.yaml
echo '          limits:' >> ~/skydns-rc.yaml
echo '            cpu: 100m' >> ~/skydns-rc.yaml
echo '            memory: 50Mi' >> ~/skydns-rc.yaml
echo '        command:' >> ~/skydns-rc.yaml
echo '        - /usr/local/bin/etcd' >> ~/skydns-rc.yaml
echo '        - -data-dir' >> ~/skydns-rc.yaml
echo '        - /var/etcd/data' >> ~/skydns-rc.yaml
echo '        - -listen-client-urls' >> ~/skydns-rc.yaml
echo '        - http://127.0.0.1:2379,http://127.0.0.1:4001' >> ~/skydns-rc.yaml
echo '        - -advertise-client-urls' >> ~/skydns-rc.yaml
echo '        - http://127.0.0.1:2379,http://127.0.0.1:4001' >> ~/skydns-rc.yaml
echo '        - -initial-cluster-token' >> ~/skydns-rc.yaml
echo '        - skydns-etcd' >> ~/skydns-rc.yaml
echo '        volumeMounts:' >> ~/skydns-rc.yaml
echo '        - name: etcd-storage' >> ~/skydns-rc.yaml
echo '          mountPath: /var/etcd/data' >> ~/skydns-rc.yaml
echo '      - name: kube2sky' >> ~/skydns-rc.yaml
echo '        image: gcr.io/google_containers/kube2sky:1.11' >> ~/skydns-rc.yaml
echo '        resources:' >> ~/skydns-rc.yaml
echo '          limits:' >> ~/skydns-rc.yaml
echo '            cpu: 100m' >> ~/skydns-rc.yaml
echo '            memory: 50Mi' >> ~/skydns-rc.yaml
echo '        args:' >> ~/skydns-rc.yaml
echo '        # command = "/kube2sky"' >> ~/skydns-rc.yaml
echo '        - -domain=cluster.local' >> ~/skydns-rc.yaml
echo '        - -kube_master_url=http://[[HOST_IP]]:8080' >> ~/skydns-rc.yaml
echo '      - name: skydns' >> ~/skydns-rc.yaml
echo '        image: gcr.io/google_containers/skydns:2015-10-13-8c72f8c' >> ~/skydns-rc.yaml
echo '        resources:' >> ~/skydns-rc.yaml
echo '          limits:' >> ~/skydns-rc.yaml
echo '            cpu: 100m' >> ~/skydns-rc.yaml
echo '            memory: 50Mi' >> ~/skydns-rc.yaml
echo '        args:' >> ~/skydns-rc.yaml
echo '        # command = "/skydns"' >> ~/skydns-rc.yaml
echo '        - -machines=http://127.0.0.1:4001' >> ~/skydns-rc.yaml
echo '        - -addr=0.0.0.0:53' >> ~/skydns-rc.yaml
echo '        - -ns-rotate=false' >> ~/skydns-rc.yaml
echo '        - -domain=cluster.local' >> ~/skydns-rc.yaml
echo '        ports:' >> ~/skydns-rc.yaml
echo '        - containerPort: 53' >> ~/skydns-rc.yaml
echo '          name: dns' >> ~/skydns-rc.yaml
echo '          protocol: UDP' >> ~/skydns-rc.yaml
echo '        - containerPort: 53' >> ~/skydns-rc.yaml
echo '          name: dns-tcp' >> ~/skydns-rc.yaml
echo '          protocol: TCP' >> ~/skydns-rc.yaml
echo '        livenessProbe:' >> ~/skydns-rc.yaml
echo '          httpGet:' >> ~/skydns-rc.yaml
echo '            path: /healthz' >> ~/skydns-rc.yaml
echo '            port: 8080' >> ~/skydns-rc.yaml
echo '            scheme: HTTP' >> ~/skydns-rc.yaml
echo '          initialDelaySeconds: 30' >> ~/skydns-rc.yaml
echo '          timeoutSeconds: 5' >> ~/skydns-rc.yaml
echo '        readinessProbe:' >> ~/skydns-rc.yaml
echo '          httpGet:' >> ~/skydns-rc.yaml
echo '            path: /healthz' >> ~/skydns-rc.yaml
echo '            port: 8080' >> ~/skydns-rc.yaml
echo '            scheme: HTTP' >> ~/skydns-rc.yaml
echo '          initialDelaySeconds: 1' >> ~/skydns-rc.yaml
echo '          timeoutSeconds: 5' >> ~/skydns-rc.yaml
echo '      - name: healthz' >> ~/skydns-rc.yaml
echo '        image: gcr.io/google_containers/exechealthz:1.0' >> ~/skydns-rc.yaml
echo '        resources:' >> ~/skydns-rc.yaml
echo '          limits:' >> ~/skydns-rc.yaml
echo '            cpu: 10m' >> ~/skydns-rc.yaml
echo '            memory: 20Mi' >> ~/skydns-rc.yaml
echo '        args:' >> ~/skydns-rc.yaml
echo '        - -cmd=nslookup kubernetes.default.svc.cluster.local localhost >/dev/null' >> ~/skydns-rc.yaml
echo '        - -port=8080' >> ~/skydns-rc.yaml
echo '        ports:' >> ~/skydns-rc.yaml
echo '        - containerPort: 8080' >> ~/skydns-rc.yaml
echo '          protocol: TCP' >> ~/skydns-rc.yaml
echo '      volumes:' >> ~/skydns-rc.yaml
echo '      - name: etcd-storage' >> ~/skydns-rc.yaml
echo '        emptyDir: {}' >> ~/skydns-rc.yaml
echo '      dnsPolicy: Default' >> ~/skydns-rc.yaml
echo 'apiVersion: v1' >> ~/skydns-svc.yaml
echo 'kind: Service' >> ~/skydns-svc.yaml
echo 'metadata:' >> ~/skydns-svc.yaml
echo '  name: kube-dns' >> ~/skydns-svc.yaml
echo '  namespace: kube-system' >> ~/skydns-svc.yaml
echo '  labels:' >> ~/skydns-svc.yaml
echo '    k8s-app: kube-dns' >> ~/skydns-svc.yaml
echo '    kubernetes.io/cluster-service: "true"' >> ~/skydns-svc.yaml
echo '    kubernetes.io/name: "KubeDNS"' >> ~/skydns-svc.yaml
echo 'spec:' >> ~/skydns-svc.yaml
echo '  selector:' >> ~/skydns-svc.yaml
echo '    k8s-app: kube-dns' >> ~/skydns-svc.yaml
echo '  clusterIP:  10.0.0.10' >> ~/skydns-svc.yaml
echo '  ports:' >> ~/skydns-svc.yaml
echo '  - name: dns' >> ~/skydns-svc.yaml
echo '    port: 53' >> ~/skydns-svc.yaml
echo '    protocol: UDP' >> ~/skydns-svc.yaml
echo '  - name: dns-tcp' >> ~/skydns-svc.yaml
echo '    port: 53' >> ~/skydns-svc.yaml
echo '    protocol: TCP' >> ~/skydns-svc.yaml
echo '{' >> ~/kube-system.json
echo '  "kind": "Namespace",' >> ~/kube-system.json
echo '  "apiVersion": "v1",' >> ~/kube-system.json
echo '  "metadata": {' >> ~/kube-system.json
echo '    "name": "kube-system"' >> ~/kube-system.json
echo '  }' >> ~/kube-system.json
echo '}' >> ~/kube-system.json
echo 'kind: List' >> ~/dashboard.yaml
echo 'apiVersion: v1' >> ~/dashboard.yaml
echo 'items:' >> ~/dashboard.yaml
echo '- kind: ReplicationController' >> ~/dashboard.yaml
echo '  apiVersion: v1' >> ~/dashboard.yaml
echo '  metadata:' >> ~/dashboard.yaml
echo '    labels:' >> ~/dashboard.yaml
echo '      app: kubernetes-dashboard' >> ~/dashboard.yaml
echo '      version: v1.0.1' >> ~/dashboard.yaml
echo '    name: kubernetes-dashboard' >> ~/dashboard.yaml
echo '    namespace: kube-system' >> ~/dashboard.yaml
echo '  spec:' >> ~/dashboard.yaml
echo '    replicas: 1' >> ~/dashboard.yaml
echo '    selector:' >> ~/dashboard.yaml
echo '      app: kubernetes-dashboard' >> ~/dashboard.yaml
echo '    template:' >> ~/dashboard.yaml
echo '      metadata:' >> ~/dashboard.yaml
echo '        labels:' >> ~/dashboard.yaml
echo '          app: kubernetes-dashboard' >> ~/dashboard.yaml
echo '      spec:' >> ~/dashboard.yaml
echo '        containers:' >> ~/dashboard.yaml
echo '        - name: kubernetes-dashboard' >> ~/dashboard.yaml
echo '          image: gcr.io/google_containers/kubernetes-dashboard-amd64:v1.0.1' >> ~/dashboard.yaml
echo '          imagePullPolicy: Always' >> ~/dashboard.yaml
echo '          ports:' >> ~/dashboard.yaml
echo '          - containerPort: 9090' >> ~/dashboard.yaml
echo '            protocol: TCP' >> ~/dashboard.yaml
echo '          args:' >> ~/dashboard.yaml
echo '            - --apiserver-host=[[HOST_IP]]:8080' >> ~/dashboard.yaml
echo '          livenessProbe:' >> ~/dashboard.yaml
echo '            httpGet:' >> ~/dashboard.yaml
echo '              path: /' >> ~/dashboard.yaml
echo '              port: 9090' >> ~/dashboard.yaml
echo '            initialDelaySeconds: 30' >> ~/dashboard.yaml
echo '            timeoutSeconds: 30' >> ~/dashboard.yaml
echo '- kind: Service' >> ~/dashboard.yaml
echo '  apiVersion: v1' >> ~/dashboard.yaml
echo '  metadata:' >> ~/dashboard.yaml
echo '    labels:' >> ~/dashboard.yaml
echo '      app: kubernetes-dashboard' >> ~/dashboard.yaml
echo '      kubernetes.io/cluster-service: "true"' >> ~/dashboard.yaml
echo '    name: kubernetes-dashboard' >> ~/dashboard.yaml
echo '    namespace: kube-system' >> ~/dashboard.yaml
echo '  spec:' >> ~/dashboard.yaml
echo '    type: NodePort' >> ~/dashboard.yaml
echo '    ports:' >> ~/dashboard.yaml
echo '    - port: 80' >> ~/dashboard.yaml
echo '      targetPort: 9090' >> ~/dashboard.yaml
echo '    selector:' >> ~/dashboard.yaml
echo '      app: kubernetes-dashboard' >> ~/dashboard.yaml
echo 'echo "Starting Kubernetes v1.2.2..."' >> ~/.bin/launch.sh
echo 'docker run -d --net=host gcr.io/google_containers/etcd:2.2.1 /usr/local/bin/etcd --listen-client-urls=http://0.0.0.0:4001 --advertise-client-urls=http://0.0.0.0:4001 --data-dir=/var/etcd/data' >> ~/.bin/launch.sh
echo 'docker run -d --name=api --net=host --pid=host --privileged=true gcr.io/google_containers/hyperkube:v1.2.2 /hyperkube apiserver --insecure-bind-address=0.0.0.0 --service-cluster-ip-range=10.0.0.1/24 --etcd_servers=http://127.0.0.1:4001 --v=2' >> ~/.bin/launch.sh
echo 'docker run -d --name=kubs --volume=/:/rootfs:ro --volume=/sys:/sys:ro --volume=/dev:/dev --volume=/var/lib/docker/:/var/lib/docker:rw --volume=/var/lib/kubelet/:/var/lib/kubelet:rw --volume=/var/run:/var/run:rw --net=host --pid=host --privileged=true gcr.io/google_containers/hyperkube:v1.2.2 /hyperkube kubelet --hostname-override="127.0.0.1" --address="0.0.0.0" --api-servers=http://0.0.0.0:8080 --cluster_dns=10.0.0.10 --cluster_domain=cluster.local --config=/etc/kubernetes/manifests-multi' >> ~/.bin/launch.sh
echo 'docker run -d --name=proxy --net=host --privileged gcr.io/google_containers/hyperkube:v1.2.2 /hyperkube proxy --master=http://0.0.0.0:8080 --v=2' >> ~/.bin/launch.sh
echo 'echo "Downloading Kubectl..."' >> ~/.bin/launch.sh
echo 'curl -o ~/.bin/kubectl http://storage.googleapis.com/kubernetes-release/release/v1.2.2/bin/linux/amd64/kubectl' >> ~/.bin/launch.sh
echo 'chmod u+x ~/.bin/kubectl' >> ~/.bin/launch.sh
echo 'export KUBERNETES_MASTER=http://docker:8080' >> ~/.bin/launch.sh
echo 'echo "Waiting for Kubernetes to start..."' >> ~/.bin/launch.sh
echo 'until $(kubectl cluster-info &> /dev/null); do' >> ~/.bin/launch.sh
echo '  sleep 1' >> ~/.bin/launch.sh
echo 'done' >> ~/.bin/launch.sh
echo 'echo "Kubernetes started"' >> ~/.bin/launch.sh
echo 'echo "Starting Kubernetes DNS..."' >> ~/.bin/launch.sh
echo 'kubectl -s http://docker:8080 create -f ~/kube-system.json' >> ~/.bin/launch.sh
echo 'kubectl -s http://docker:8080 create -f ~/skydns-rc.yaml' >> ~/.bin/launch.sh
echo 'kubectl -s http://docker:8080 create -f ~/skydns-svc.yaml' >> ~/.bin/launch.sh
echo 'echo "Starting Kubernetes UI..."' >> ~/.bin/launch.sh
echo 'kubectl -s http://docker:8080 create -f ~/dashboard.yaml' >> ~/.bin/launch.sh
echo 'kubectl -s http://docker:8080 cluster-info' >> ~/.bin/launch.sh
chmod +x ~/.bin/launch.sh
curl -L http://assets.joinscrapbook.com/unzip -o ~/.bin/unzip
chmod +x ~/.bin/unzip
launch.sh

docker pull deis/redis:v0.0.5
