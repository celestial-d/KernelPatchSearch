#!/bin/bash
#copy all key word patch to the same folder
key='consist'
mkdir $key
for file in patches/*;
do
#	echo $file
	grep -q 'consist' $file #'data loss'
	if [ "$?" == 0 ]; then
		echo $file
		cp $file $key/.
	fi
done


