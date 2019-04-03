#create GCP instance on GCP console
#upload this file to GCP instance via
# 1- gcloud compute scp ....
# 2- wget https://raw.githubusercontent.com/tansudasli/california-bigdata-training/master/install_cloudera_stack.sh
# 3- or, manually on default ssh screens of GCP

echo "give run permisson fist w/ chmod +x install_cloudera_stack.sh, then run ./install_cloudera_stack.sh"

#install docker
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
#restart terminal

#install cloudera
wget https://downloads.cloudera.com/demo_vm/docker/cloudera-quickstart-vm-5.13.0-0-beta-docker.tar.gz
tar -xvf cloudera-quickstart-vm-5.13.0-0-beta-docker.tar.gz
cd cloudera-quickstart-vm-5.13.0-0-beta-docker/
sudo docker import cloudera-quickstart-vm-5.13.0-0-beta-docker.tar
echo "image id will be detected"
IMAGE_ID=$(docker images -a --format "{{.ID}}" | head -1)
sudo docker run --hostname=quickstart.cloudera --privileged=true -tid -p 80:80  -p 11000:11000 -p 7180:7180 -p 50070:50070 -p 21050:21050 -p 18088:18088 -p 2181:2181 -p 8983:8983 -p 8984:8984 -p 8888:8888 $IMAGE_ID /usr/bin/docker-quickstart

echo "open above ports on GCP Firewall for web UI access !!!"
echo "docker attach and run inside docker instance /home/cloudera/cloudera-manager --express --force"