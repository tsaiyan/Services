RED= `tput setaf 2`
NC='\033[0m'

minikube addons enable metrics-server
minikube addons enable metallb
echo "${RED}\nLET GO RUN SERVICES \n\n${NC}"
#minikube stop
#minikube delete
#echo "MINICUBE START"
#minikube start --vm-driver=docker
echo "DOCKER BUILD"
eval $(minikube docker-env)
docker build -t php_image ./srcs/phpmyadmin/
eval $(minikube docker-env)
docker build -t nginx_image ./srcs/nginx/
docker build -t wordpress_image ./srcs/wordpress/
#kubectl delete --all pods
kubectl apply -f srcs/configmap.yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml
minikube addons list
kubectl get pods
minikube dashboard
