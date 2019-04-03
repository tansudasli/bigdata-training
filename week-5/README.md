# How to setup pyspark

When you run `sudo easy_install ipython==1.2.1`, you get *easy_install: command not found* error. 

If that's the case,
* 1- remove sudo, and thry. cause docker image is already connected as root :`easy_install https://pypi.python.org/packages/source/i/ipython/ipython-1.2.1.tar.gz#md5=4ffb36697f7ca8cb4a2de0f5b30bc89c` 

* run pyspark inside ipython shell: PYSPARK_DRIVER_PYTHON=ipython pyspark

