RED= `tput setaf 2`
NC='\033[0m'

minikube stop
minikube delete
VBoxManage hostonlyif remove vboxnet0
minikube start --vm-driver=virtualbox --cpus=4 --memory=4G --disk-size=50G
eval $(minikube docker-env)
minikube addons enable metrics-server
minikube addons enable metallb
echo "${RED}\nLET GO RUN SERVICES \n\n${NC}"
#minikube stop
kubectl delete --all pods
#minikube delete
#echo "MINICUBE START"
#minikube start --vm-driver=docker
docker rm nginx_image
echo "DOCKER BUILD"
docker build -t nginx_image ./srcs/nginx/
#kubectl delete --all pods
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/nginx/ConfigMap.yaml
minikube addons list
kubectl get pods
minikube dashboard
