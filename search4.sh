#!/bin/bash
#copy patch to a folder, name in a file
key='774_ori'
mkdir $key
for line in `cat pmem`;
do
		#name=`echo $file|cut -d '/' -f 3`
		#echo $file		
		echo $line
		cp patch_newt/${line}* $key/.
	
done


