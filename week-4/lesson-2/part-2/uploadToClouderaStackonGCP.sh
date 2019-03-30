#deliver your code to your git
#login your cloudera stack instance on GCP
#get your codes into GCP instance 
git clone https://github.com/tansudasli/california-bigdata-training.git

#transfer codes from GCP instance to cloudera-stack-docker
#start docker. copy to docker. give execution permission
docker cp california-bigdata-training/ ee75aeac85461:/
chmod +x mapper.py
chmod +x reducer.py

#attach docker e75aeac85461
docker attach e75aeac85461
hdfs dfs -ls /user/cloudera/
hdfs dfs -put california-bigdata-training /user/cloudera/

#
cd /california-bigdata-training/week-4/lesson-2/part-1
#see step's results
cat input/*.txt
cat input/*.txt | ./mapper.py | sort

#then see the final results for debugging
cat input/*.txt | ./mapper.py | sort | ./reducer.py

#run it on hadoop
hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar 
-input /user/cloudera/california-bigdata-training/week-4/lesson-2/part-2/input  
-output /user/cloudera/california-bigdata-training/week-4/lesson-2/part-2/output 
-mapper /california-bigdata-training/week-4/lesson-2/part-2/mapper.py 
-reducer /california-bigdata-training/week-4/lesson-2/part-2/reducer.py