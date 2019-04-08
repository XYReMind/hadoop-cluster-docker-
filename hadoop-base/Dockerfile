FROM ubuntu

MAINTAINER xiaoyuan

RUN apt-get update && apt-get install -y openssh-server ssh wget vim
RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
RUN apt-get install net-tools

#start sshd service
RUN echo "/etc/init.d/ssh start" >> ~/.bashrc
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
#RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key

#jdk setup
RUN apt-get install -y openjdk-8-jdk
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV PATH=$PATH:$JAVA_HOME/bin
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-open-jdk-amd64" >> ~/.bashrc
RUN echo "export CLASSPATH=.:$JAVA_HOME/lib" >> ~/.bashrc
RUN echo "export PATH=$PATH:$JAVA_HOME/bin" >> ~/.bashrc

#install hadoop-3.1.2
RUN wget http://mirrors.sonic.net/apache/hadoop/common/hadoop-3.1.2/hadoop-3.1.2.tar.gz && \
    tar -xzvf hadoop-3.1.2.tar.gz && \
    mv hadoop-3.1.2 /usr/local/hadoop && \
    rm hadoop-3.1.2.tar.gz

RUN mkdir -p /usr/local/hadoop/namenode_dir && \
    mkdir -p /usr/local/hadoop/datanode_dir && \
    mkdir -p /usr/local/hadoop/tmp

RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/" >> /usr/local/hadoop/etc/hadoop/hadoop-env.sh
RUN echo "export HDFS_NAMENODE_USER=root" >> /usr/local/hadoop/etc/hadoop/hadoop-env.sh
RUN echo "export HDFS_DATANODE_USER=root" >> /usr/local/hadoop/etc/hadoop/hadoop-env.sh
RUN echo "export HDFS_SECONDARYNAMENODE_USER=root" >> /usr/local/hadoop/etc/hadoop/hadoop-env.sh
RUN echo "export YARN_RESOURCEMANAGER_USER=root" >> /usr/local/hadoop/etc/hadoop/hadoop-env.sh
RUN echo "export YARN_NODEMANAGER_USER=root" >> /usr/local/hadoop/etc/hadoop/hadoop-env.sh

COPY config/* /tmp/

ENV HADOOP_HOME=/usr/local/hadoop
ENV PATH=$PATH:$HADOOP_HOME/bin
RUN mv /tmp/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml && \
    mv /tmp/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml && \
    mv /tmp/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml && \
    mv /tmp/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml && \
    mv /tmp/start-hadoop.sh ~/start-hadoop.sh

COPY genSSH.exp /root
COPY startHadoop.exp /root
#COPY startHadoop.sh /root

RUN echo "export HADOOP_HOME=/usr/local/hadoop" >> ~/.bashrc
RUN echo "export PATH=$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH" >> ~/.bashrc










