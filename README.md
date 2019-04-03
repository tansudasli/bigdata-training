## california-bigdata-training
Big Data (Hadoop and Spark) Training by University of California San Diego on Coursera platform

## How to start
create a GCP instance on GCP console, then 
###### 1- upload *install_cloudera_stack.sh* or *tansudasli/california-bigdata-training* to GCP instance via
* `gcloud compute scp ....`
* `git clone ....`
* or, manually on default ssh screens of GCP

then give run permisson to install_cloudera_stack.sh file
###### 2- `chmod +x california-bigdata-training/install_cloudera_stack.sh` 
and run, 
###### 3- `./california-bigdata-training/install_cloudera_stack.sh` 

if you face w/ connection or downloading issues, run it again after delete unnecessary folders.

## some notes
* for general information about cloudera ports, use *cloudera ports.txt* 
* general hadoop commands can be found in *some hadoop commands.txt* file. 
* use *uploadToClouderaStackonGCP* files for detailed commands under week* folders.

