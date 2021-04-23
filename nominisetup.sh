

minikube addons enable metrics-server
minikube addons enable metallb
#minikube stop
#minikube delete
#echo "MINICUBE START"
#minikube start --vm-driver=docker

#docker
echo "DOCKER BUILD"
eval $(minikube docker-env)
docker build -t nginx_image ./srcs/nginx/
docker build -t php_image ./srcs/phpmyadmin/
docker build -t wordpress_image ./srcs/wordpress/
docker build -t mysql_image ./srcs/mysql/
docker build -t ftps_image ./srcs/ftps/
docker build -t grafana_image ./srcs/grafana/
docker build -t influxdb_image ./srcs/influxdb/

#yaml
kubectl apply -f srcs/configmap.yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/mysql/mysql.yaml
kubectl apply -f srcs/ftps/ftps.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml
kubectl apply -f srcs/grafana/grafana.yaml
kubectl apply -f srcs/ftps/ftps.yaml
kubectl apply -f srcs/influxdb/influxdb.yaml

minikube addons list
kubectl get pods
minikube dashboard
