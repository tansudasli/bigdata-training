## california-bigdata-training
Big Data (Hadoop and Spark) Training by University of California San Diego on Coursera platform

To establish a cloudera stack takes time. So to wramp up this process, use *install_cloudera_stack.sh* file. It downloads docker and installs on ubuntu server. And Then downloads latest cloudera docker image on top of it.

## How to start
create a GCP (ubuntu 18.04) instance on GCP console, then connect with that server via appropriate SSH ways.
* 'gcloud compute --project .... ssh --zone .... ....' 

###### 1- upload *install_cloudera_stack.sh* or *tansudasli/california-bigdata-training* to GCP instance via
`wget https://raw.githubusercontent.com/tansudasli/california-bigdata-training/master/install_cloudera_stack.sh`

###### 2- then give run permisson to install_cloudera_stack.sh file
`chmod +x install_cloudera_stack.sh` 

###### 3- and run,
`./install_cloudera_stack.sh` 

if you face w/ connection or downloading issues, run it again after delete unnecessary folders.

###### 4-open above ports on GCP Firewall for web UI access
* 80 - getting started, 
* 7180 - cloudera manager, 
* 8888 - hue

###### 5-docker attach and run inside docker instance to start cloudera stack.
`/home/cloudera/cloudera-manager --express --force`

###### 6-connect your cloudera manager IP:7180. Then 
* solve warnings (esp. memory ones. not HA issues or canary ones)
* restart cloudera

## some notes
* for general information about cloudera ports, use *cloudera ports.txt* 
* general hadoop commands can be found in *week-3*. 
* use *uploadToClouderaStackonGCP* files for detailed commands under week* folders.

## cloudera ports
### Mandotary ports
* 7180 Cloudera manager
* 8888 hue web ui
* 80 getting started docs

### optional
* 60030
* 25000 impala
* 11000/oozie
* 50070 namenode web uı
* 21050
* 8088 Job manager
* 18088 spark web ui
* 2181 solr, 8983 and 8984 solr admin
* 14000 webhdfs

