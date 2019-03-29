#upload files to GCP instance
gcloud compute scp $(pwd)/*.py cloudera-lite-1:~
gcloud compute scp $(pwd)/test* cloudera-lite-1:~
#connectto GCP instance
gcloud compute --project "cloudera-training-232215" ssh --zone "europe-west3-c" "cloudera-lite-1"

#upload files to cloudera docker, run below commands indivudually in yor terminal
docker cp wordcount_mapper.py e75aeac85461:/ 
docker cp wordcount_reducer.py e75aeac85461:/
docker cp testfile1 e75aeac85461:/
docker cp testfile2 e75aeac85461:/

#give permission
chmod +x wordcount_mapper.py
chmod +x wordcount_reducer.py

#create folder on hadoop
export HADOOP_USER_NAME=hdfs
hdfs dfs -mkdir /user/cloudera/input
hdfs dfs -put testfile1 /user/cloudera/input
hdfs dfs -put testfile2 /user/cloudera/input

#run hadoop
hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar \
   -input /user/cloudera/input \
   -output /user/cloudera/output_new \
   -mapper /wordcount_mapper.py \
   -reducer /wordcount_reducer.py

hdfs dfs -ls /user/cloudera/output_new
hdfs dfs -cat /user/cloudera/output_new/part-00000

#onlu mapper results will be delivered
hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar \
   -input /user/cloudera/input \
   -output /user/cloudera/output \
   -mapper /wordcount_mapper.py \
   -reducer /wordcount_reducer.py \
   -numReduceTasks 0

#merge files for uploading
hdfs dfs -getmerge /user/cloudera/output_new_0/* wordcount_num0_output.txt  