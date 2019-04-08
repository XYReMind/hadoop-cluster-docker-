#### An Example of Mapreduce

#### In the master container(in the directory of hadoop):
- create a folder for input:   
./bin/hdfs dfs -mkdir -p /user/hadoop/input       
- create some text files for word count testing, and move them to hdfs input folder. using command:       
./bin/hdfs dfs -put files'director /user/hadoop/input        
- check:        
./bin/hdfs dfs -ls /user/hadoop/input          
- run word count example:         
./bin/hadoop jar ./share/hadoop/mapreduce/sources/hadoop-mapreduce-examples-3.1.2-sources.jar org.apache.example.WordCount /user/hadoop/input output         
- check the output:          
./bin/hdfs dfs -cat output/*    
