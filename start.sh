id=278051

preserve -llist
# write allocated nodes to slaves file
var1=$(preserve -llist | grep $id)
echo $var1 | grep -P 'node\d+' -o > $HADOOP_HOME/etc/hadoop/slaves 
echo $var1 | grep -P 'node\d+' -o > $SPARK_HOME/conf/slaves 
sleep 7s

#yarn mode
#sed -i 's/hibench.spark.master.*/hibench.spark.master\tyarn-client/' $HIBENCH_HOME/conf/spark.conf

#standalone mode
master='spark://fs1:7272'
sed -i -e "s@hibench.spark.master.*@hibench.spark.master\t${master}@
       s@spark.executor.memory.*@spark.executor.memory\t9g@
        s@spark.driver.memory.*@spark.driver.memory\t4g@
       " $HIBENCH_HOME/conf/spark.conf
 
# start hadoop
$HADOOP_HOME/sbin/start-dfs.sh
sleep 15s
$HADOOP_HOME/sbin/start-yarn.sh
sleep 15s
hdfs dfsadmin -safemode leave

#start spark

sed -i -e 's/SPARK_WORKER_INSTANCE.*/SPARK_WORKER_INSTANCES=6/
	s/SPARK_WORKER_CORES.*/SPARK_WORKER_CORES=5/' $SPARK_HOME/conf/spark-env.sh 

$SPARK_HOME/sbin/start-all.sh
