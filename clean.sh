var1=$(preserve -llist | grep ddps2012)
nodes=$(echo $var1 | grep -P 'node\d+' -o)

for node in $nodes
do
	ssh $node 'rm -rf /local/ddps2012/hadoop/*'
done

rm -rf $HADOOP_HOME/tmp/*

# format hdfs file system
$HADOOP_HOME/bin/hdfs namenode -format



