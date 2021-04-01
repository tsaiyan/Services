minikube stop
minikube delete
VBoxManage hostonlyif remove vboxnet0
minikube start --vm-driver=virtualbox --cpus=4 --memory=4G --disk-size=50G
sh run.sh
