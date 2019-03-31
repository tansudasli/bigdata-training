#upload files to GCP instance
gcloud compute scp $(pwd)/*.py cloudera-lite-1:~
gcloud compute scp $(pwd)/test* cloudera-lite-1:~
#connectto GCP instance
gcloud compute --project "cloudera-training-232215" ssh --zone "europe-west3-c" "cloudera-lite-1"

#transfer codes from GCP instance to cloudera-stack-docker
#start docker. copy to docker. give execution permission
docker cp california-bigdata-training/ ee75aeac85461:/
chmod +x mapper.py
chmod +x reducer.py

#give permission
chmod +x mapper.py
chmod +x reducer.py

#create folder on hadoop
export HADOOP_USER_NAME=hdfs
hdfs dfs -mkdir /user/cloudera/input
hdfs dfs -put testfile1 /user/cloudera/input
hdfs dfs -put testfile2 /user/cloudera/input

#run hadoop
hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar \
   -input /user/cloudera/input \
   -output /user/cloudera/output \
   -mapper /mapper.py \
   -reducer /reducer.py

#to see results
hdfs dfs -ls /user/cloudera/output
hdfs dfs -cat /user/cloudera/output/part-00000
hdfs dfs -cat /user/cloudera/output/*

#only mapper results will be delivered
#set numReduceTasks=0 !, and change output folder
hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar \
   -input /user/cloudera/input \
   -output /user/cloudera/output-2 \
   -mapper /mapper.py \
   -reducer /reducer.py \
   -numReduceTasks 0

#merge files for uploading under GCP instance's /
hdfs dfs -getmerge /user/cloudera/output-2/* wordcount_output.txt  
# cat /user/cloudera/output-2/* 