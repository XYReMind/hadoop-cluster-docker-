#### 1. After installing the images, create three containers as follow:
- docker run -it -h master --name master ubuntu/hadoopinstalled
- docker run -it -h slave01 --name slave01 ubuntu/hadoopinstalled
- docker run -it -h slave02 --name slave02 ubuntu/hadoopinstalled

#### 2. Then make changes to /etc/hosts of the three containers. Add three ip addresses. For example:
- 172.18.0.2      master
- 172.18.0.3      slave01
- 172.18.0.4      slave02

#### 3. vim usr/local/hadoop/etc/hadoop/workers and change localhost to slave01 and slave02.

#### 4.cd usr/local/hadoop in master:
- bin/hdfs namenode –format
- sbin/start-all.sh

#### 5.Use command jps to test the connection. Something like:
>1075 Jps   
>759 ResourceManager   
>283 NameNode  
>492 SecondaryNameNode   




  