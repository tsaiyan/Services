eval $(minikube docker-env)
kubectl exec deploy/wordpress-deployment -- pkill nginx
kubectl exec deploy/wordpress-deployment -- pkill php-fpm
kubectl exec deploy/phpmyadmin-deployment -- pkill nginx
kubectl exec deploy/phpmyadmin-deployment -- pkill php-fpm
kubectl exec deploy/nginx-deployment -- pkill nginx
kubectl exec deploy/nginx-deployment -- pkill sshd
kubectl exec deploy/mysql-deployment -- pkill mysqld
kubectl exec deploy/influxdb-deployment -- pkill telegraf
kubectl exec deploy/influxdb-deployment -- pkill influxd
kubectl exec deploy/grafana-deployment -- pkill grafana
kubectl exec deploy/ftps-deployment -- pkill vsftpd
