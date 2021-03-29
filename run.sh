RED= `tput setaf 2`
NC='\033[0m'

echo "${RED}\nLET GO RUN SERVICES \n\n${NC}"
minikube stop
kubectl delete pods
minikube delete
echo "MINICUBE START"
minikube start --vm-driver=docker
eval $(minikube docker-env)
echo "DOCKER BUILD"
docker build -t nginx_image .
kubectl apply -f nginx.yaml
kubectl get pods
minikube dashboard
