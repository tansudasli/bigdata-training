## california-bigdata-training
Big Data (Hadoop and Spark) Training by University of California San Diego on Coursera platform

## How to start
create a GCP (ubuntu 18.04) instance on GCP console, then 
###### 1- upload *install_cloudera_stack.sh* or *tansudasli/california-bigdata-training* to GCP instance via
* `gcloud compute scp ....`
* `git clone ....`
* or, manually on default ssh screens of GCP

then give run permisson to install_cloudera_stack.sh file
###### 2- `chmod +x california-bigdata-training/install_cloudera_stack.sh` 
and run, 
###### 3- `./california-bigdata-training/install_cloudera_stack.sh` 

if you face w/ connection or downloading issues, run it again after delete unnecessary folders.

This script will download docker and install on ubuntu server. Then downloads latest cloudera docker image on top of it.

###### 4-open above ports on GCP Firewall for web UI access
* 80 - getting started, 
* 7180 - cloudera manager, 
* 8888 - hue

###### 5-docker attach and run inside docker instance to start cloudera stack.
* `/home/cloudera/cloudera-manager --express --force`

###### 6-connect your cloudera manager IP:7180. Then 
* solve warnings (esp, memory ones)
* restart cloudera

## some notes
* for general information about cloudera ports, use *cloudera ports.txt* 
* general hadoop commands can be found in *some hadoop commands.txt* file. 
* use *uploadToClouderaStackonGCP* files for detailed commands under week* folders.

