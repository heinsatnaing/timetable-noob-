#!/bin/bash
rm -rf table
cp original_table table
chmod a+x table
echo "###################################"
echo "# $(date) #"
echo "###################################"

echo "Set your daily timetable"
count=0
limiter=22
until [ $count -gt 20 ]
do
	read -p "Add work for $(echo $[$count+4]):00 :>>" sub
	count=$(echo $[$count+1])
	limiter=$(echo $[$limiter-1])
	sed -i 's/'$(echo ${limiter}_h)'/'$sub'/g' table
done
