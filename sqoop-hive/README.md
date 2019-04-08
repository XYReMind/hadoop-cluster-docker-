1.open three containers and one mysql container  
  docker run --name mysql -e MYSQL_ROOT_PASSWORD=123456 -d -i --restart=always  mysql   
  docker exec -ti mysql bash    
  mysql -h localhost -P 3306 --protocol=tcp     
2.change containers' etc/hosts,delete everything about localhost， change master' s workers file like before     
3.in the directory of hadoop: start hdfs， jps test     
4.test whether sqoop has connected to the remote mysql      
5.in the directory of hive ./bin/schematool -initSchema -dbType mysql     
  ./bin/hive to start hive and database and tables     
6.import data from mysql to hive      
   ./bin/sqoop import --connect jdbc:mysql://172.17.0.5:3306/students --username root --password 123456 --table student --hive-database student_test --hive-table student_table_test --hive-import       

 >>> CREATE TABLE users(id int, name string) ROW FORMAT DELIMITED FIELDS TERMINATED BY ' ' LINES TERMINATED BY '\n' STORED AS TEXTFILE;     
 

 