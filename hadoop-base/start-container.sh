#/bin/bash
# the name of the containers
hadoop_arr=("master" "slave01" "slave02");
# the addresses of the containers
hadoop_ip=("100.10.0.100" "100.10.0.101" "100.10.0.102");
for((m=0;m<${#hadoop_arr[*]};m++));
do
docker run -tid --name ${hadoop_arr[$m]} -h ${hadoop_arr[m]} --add-host hadoop0:100.10.0.100 --add-host hadoop1:100.10.0.101 --add-host hadoop2:100.10.0.102 --net=HZ --ip=${hadoop_ip[m]} hadoop/ubuntu
done;
# create ssh public and private key
for((m=0;m<${#hadoop_arr[*]};m++));
do
docker exec ${hadoop_arr[m]} rm -rf ~/.ssh;
docker exec ${hadoop_arr[m]} mkdir -p ~/.ssh;
docker exec ${hadoop_arr[m]} ssh-keygen -t rsa -f ~/.ssh/id_rsa -P "";
done;

# communicate
for((m=0;m<${#hadoop_arr[*]};m++));
do
  for((n=0;n<${#hadoop_arr[*]};n++));
  do
    docker exec ${hadoop_arr[m]} expect -f /root/genSSH.exp root root ${hadoop_arr[n]};
  done;
done;

# format hdfs
docker exec master hdfs namenode -format
# start hadoop
docker exec master /root/startHadoop.exp