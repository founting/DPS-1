$HADOOP_HOME/sbin/stop-yarn.sh
sleep 15s
$HADOOP_HOME/sbin/stop-dfs.sh
#sleep 15s
$SPARK_HOME/sbin/stop-all.sh
