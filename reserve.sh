#preserve nodes
N=5 #number of nodes
id=$(preserve -# $N -t 00:15:00 | grep -P '(?<=Reservation number )\d+' -o)

sed -i "s/id=.*/id=${id}/" start.sh 
sed -i "s/N=.*/N=$N/" run_kmeans.sh
sleep 5
preserve -llist
