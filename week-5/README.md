# How to setup pyspark
First, connect to your GCP instance. Then attach to cloudera docker image. This will connect you as root user. So you do not need `sudo` prefix.

When you run `sudo easy_install ipython==1.2.1`, you get *easy_install: command not found* error. 

If that's the case,
* 1- remove sudo, and try with package path. cause docker image is already connected as root :
 `easy_install https://pypi.python.org/packages/source/i/ipython/ipython-1.2.1.tar.gz#md5=4ffb36697f7ca8cb4a2de0f5b30bc89c` 

* 2- copy files into hdfs. normally you only need to copy input files.<br />
`export HADOOP_USER_NAME=hdfs`
`hdfs dfs -put california-bigdata-training/ /user/cloudera/`

* 3- run pyspark inside ipython shell 
 `PYSPARK_DRIVER_PYTHON=ipython pyspark`

Now, you can write code in python-shell



