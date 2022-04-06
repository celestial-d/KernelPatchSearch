#!/bin/bash
#key='refined_fix_bug' #revise
#mkdir $key
for file in refined_fix_bug/*;
do
#	echo $file
	year=`grep -m1 '^Date:' $file|cut -d " " -f 5`
	if [ $year -le 2009 ]; then
		echo $file
		echo $year
		#cp $file $key/.
		rm -rf $file
	fi
	
done


