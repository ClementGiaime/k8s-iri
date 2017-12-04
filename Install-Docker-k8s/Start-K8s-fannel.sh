#################################
# Initialisation du Cluster k8s #
#################################

echo -n "ip address of the master : "
read ip

kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=$ip
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.9.0/Documentation/kube-flannel.yml
