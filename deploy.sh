kubectl apply -f mqtt/pod.yaml
kubectl apply -f mqtt/service.yaml

kubectl apply -f nodered/pvc.yaml
kubectl apply -f nodered/pod.yaml
kubectl apply -f nodered/service.yaml
