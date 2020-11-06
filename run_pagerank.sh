

# hibench.conf
sed -i 's/hibench.pagerank.gigantic.pages.*/hibench.pagerank.gigantic.pages\t20000000/' $HIBENCH_HOME/conf/workloads/websearch/pagerank.conf
sed -i 's/hibench.scale.profile.*/hibench.scale.profile\tgigantic/' $HIBENCH_HOME/conf/hibench.conf

sleep 7s

# run hibench
$HIBENCH_HOME/bin/workloads/websearch/pagerank/prepare/prepare.sh
$HIBENCH_HOME/bin/workloads/websearch/pagerank/hadoop/run.sh
$HIBENCH_HOME/bin/workloads/websearch/pagerank/spark/run.sh

#
