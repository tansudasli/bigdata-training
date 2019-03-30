# california-bigdata-training
Big Data (Hadoop and Spark) Training by University of California San Diego on Coursera platform

#some notes
use uploadToClouderaStackonGCP files for detailed commands.

#some hadoop commands 
> hdfs dfs -put localFile /user/cloudera     {put a local file into hdfs file system}
> pig -x mapreduce          {pig CLI}
   grunt>  A = load ‘frpmHDFSFile’ using PigStorage(‘separator’);
   grunt>  B = foreach A generate $0, $1;
   grunt>  dump B;
   grunt>  store B into ‘outputFile’;
   grunt>  quit

> hdfs dfs -ls /user/cloudera   {shows outputFile}

      
Hive -> data in hfs and hbase  
   
> hdfs dfs -put localFile /tmp          
> beeline -u jdbc:hive2://  
   Jdbc:hive2://>  create table tableName (field STRING, field_2 INT) \
                            ROW FORMAT DELIMITED FIELDS TERMINATED BY ‘separator’  \
                             STORED AS TEXTFILE;
   Jdbc:hive2://>  LOAD DATA INPATH ‘tmp/fileName’ OVERWRITE \
                           INTO TABLE tableName;
   Jdbc:hive2://>  Select * from tableName;

       
> hbase shell   {key=value database columnar}
   hbase(main)>  create ‘tableName’, {NAME=>’field’}, {NAME=>’field_2’}
   hbase(main)>  put ‘tableName’, ‘r1’, ‘field’, ‘value’  
   hbase(main)>  put ‘tableName’, ‘r1’, ‘field_2’, ‘value_2’ 
   hbase(main)>  put ‘tableName’, ‘r2’, ‘field’, ‘value’ 
   hbase(main)>  put ‘tableName’, ‘r2’, ‘field_2’, ‘value_2’
   hbase(main)>  scan ’tableName’
   hbase(main)>  scan ‘tableName’,  {COLUMNS=>’field_2}
  
   
      
      
  
   
