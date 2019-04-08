FROM hadoop-ubuntu

MAINTAINER xiaoyuan

RUN wget http://archive.apache.org/dist/sqoop/1.4.7/sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz && \
    tar -xzvf sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz && \
    mv sqoop-1.4.7.bin__hadoop-2.6.0 /usr/local/sqoop && \
    rm sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz

RUN echo "export SQOOP_HOME=/usr/local/sqoop" >> ~/.bashrc
RUN echo "export PATH=$SQOOP_HOME/bin:$PATH" >> ~/.bashrc

RUN mv /usr/local/sqoop/conf/sqoop-env-template.sh /usr/local/sqoop/conf/sqoop-env.sh
RUN echo "export HADOOP_HOME=/usr/local/hadoop" >> /usr/local/sqoop/conf/sqoop.env.sh && \
    echo "export HADOOP_HOME=/usr/local/hadoop" >> /usr/local/sqoop/conf/sqoop.env.sh && \
    echo "export HADOOP_COMMON_HOME=/usr/local/hadoop" >> /usr/local/sqoop/conf/sqoop.env.sh

#install mysql-connector
COPY mysql-connector-java-8.0.15.tar.gz .
RUN tar -xzvf mysql-connector-java-8.0.15.tar.gz

RUN  cp mysql-connector-java-8.0.15/mysql-connector-java-8.0.15.jar /usr/local/sqoop/lib

#install hive
RUN wget http://mirror.its.dal.ca/apache/hive/hive-3.1.1/apache-hive-3.1.1-bin.tar.gz
RUN tar -xzvf apache-hive-3.1.1-bin.tar.gz && \
    mv apache-hive-3.1.1-bin /usr/local/hive && \
    rm apache-hive-3.1.1-bin.tar.gz

RUN cp mysql-connector-java-8.0.15/mysql-connector-java-8.0.15.jar /usr/local/hive/lib && \
    rm mysql-connector-java-8.0.15.tar.gz

RUN echo "export HIVE_HOME=/usr/local/hive" >> ~/.bashrc
RUN echo "export PATH=$PATH:$HIVE_HOME/bin" >> ~/.bashrc
RUN echo "export CLASSPATH=$CLASSPATH:/usr/local/hive/lib/*:" >> ~/.bashrc
RUN . ~/.bashrc

RUN cp /usr/local/hive/conf/hive-env.sh.template /usr/local/hive/conf/hive-env.sh && \
    cp /usr/local/hive/conf/hive-env.sh.template /usr/local/hive/conf/hive-default.xml && \
    cp /usr/local/hive/conf/hive-log4j2.properties.template /usr/local/hive/conf/hive-log4j2.properties && \
    echo "export HADOOP_HOME=/usr/local/hadoop" >> /usr/local/hive/conf/hive-env.sh && \
    echo "export HIVE_CONF_DIR=/usr/loca/hive/conf" >> /usr/local/hive/conf/hive-env.sh

COPY hive-site.xml /usr/local/hive/conf
RUN echo "hive.log.dir=/usr/local/hive/logs" >> /usr/local/hive/conf/hive-log4j2.properties


