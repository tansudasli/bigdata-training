#deliver your code to your git
#login your cloudera stack instance on GCP
#get your codes into GCP instance 
git clone https://github.com/tansudasli/california-bigdata-training.git

#transfer codes from GCP instance to cloudera-stack-docker
#start docker
docker cp california-bigdata-training/ ee75aeac85461:/
chmod +x join1_mapper.py
chmod +x join1_reducer.py

#attach docker e75aeac85461
docker attach e75aeac85461
hdfs dfs -ls /user/cloudera/
hdfs dfs -put california-bigdata-training /user/cloudera/

#
cd /california-bigdata-training/week-4/lesson-2/part-1
#see step's results
cat input/join1_File*.txt
cat input/join1_File*.txt | ./join1_mapper.py | sort

#then see the final results for debugging
cat input/join1_File*.txt | ./join1_mapper.py | sort | ./join1_reducer.py

#run it on hadoop
hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar -input /user/cloudera/california-bigdata-training/week-4/lesson-2/part-1/input  -output /user/cloudera/california-bigdata-training/week-4/lesson-2/part-1/output -mapper /california-bigdata-training/week-4/lesson-2/part-1/join1_mapper.py -reducer /california-bigdata-training/week-4/lesson-2/part-1/join1_reducer.py