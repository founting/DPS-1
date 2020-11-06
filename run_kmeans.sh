
N=5

# hibench.conf
sed -i -e "s/hibench.kmeans.huge.num_of_samples.*/hibench.kmeans.huge.num_of_samples\t250000000/
	s/hibench.kmeans.huge.samples_per_inputfile.*/hibench.kmeans.huge.samples_per_inputfile\t$((250000000/$N))/
	" $HIBENCH_HOME/conf/workloads/ml/kmeans.conf
 
sed -i 's/hibench.scale.profile.*/hibench.scale.profile\thuge/' $HIBENCH_HOME/conf/hibench.conf

sleep 7s

# run hibench

$HIBENCH_HOME/bin/workloads/ml/kmeans/prepare/prepare.sh
$HIBENCH_HOME/bin/workloads/ml/kmeans/hadoop/run.sh
$HIBENCH_HOME/bin/workloads/ml/kmeans/spark/run.sh

#
