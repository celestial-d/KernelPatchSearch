#!/bin/bash
#consider capital and normal problem
#key='consist' #revise
#mkdir $key
for file in all/*;
do
#	echo $file
	
	grep -q -i 'consist' $file #revise -i
	if [ "$?" == 0 ]; then
		echo $file
		cp $file consist/.
	fi
	
done


