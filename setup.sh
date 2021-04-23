echo "\033[36m\n***********MINIKUBE DELETING***********\n\033[0m"
#minikube stop
#minikube delete
VBoxManage hostonlyif remove vboxnet0
echo "\033[36m\n***********MINIKUBE STARTING***********\n\033[0m"
minikube start --vm-driver=virtualbox --cpus=4 --memory=4G --disk-size=50G


echo "\033[36m\n***********addons enabling***********\n\033[0m"
minikube addons enable metrics-server
minikube addons enable metallb

echo "\033[36m\n***********DOCKER BUILDINGS***********\n\033[0m"
eval $(minikube docker-env)
echo "\033[35m\n***********NGINX***********\n\033[0m"
docker build -t nginx_image ./srcs/nginx/
echo "\033[35m\n***********PHP***********\n\033[0m"
docker build -t php_image ./srcs/phpmyadmin/
echo "\033[35m\n***********WP***********\n\033[0m"
docker build -t wordpress_image ./srcs/wordpress/
echo "\033[35m\n***********MYSQL***********\n\033[0m"
docker build -t mysql_image ./srcs/mysql/
echo "\033[35m\n***********FTPS***********\n\033[0m"
docker build -t ftps_image ./srcs/ftps/
echo "\033[35m\n***********GRAFANA***********\n\033[0m"
docker build -t grafana_image ./srcs/grafana/
echo "\033[35m\n***********INFLUX***********\n\033[0m"
docker build -t influxdb_image ./srcs/influxdb/

echo "\033[36m\n***********YAML APPLIES***********\n\033[0m"
kubectl apply -f srcs/configmap.yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/mysql/mysql.yaml
kubectl apply -f srcs/ftps/ftps.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml
kubectl apply -f srcs/grafana/grafana.yaml
kubectl apply -f srcs/ftps/ftps.yaml
kubectl apply -f srcs/influxdb/influxdb.yaml

echo "\033[36m\n***********ADDONS***********\n\033[0m"
minikube addons list
sleep 5
echo "\033[36m\n***********PODS***********\n\033[0m"
kubectl get pods
minikube dashboard
