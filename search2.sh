#!/bin/bash
key='pmem'
mkdir $key
for file in unknown/$key/*;
do
		name=`echo $file|cut -d '/' -f 3`
		#echo $file		
		echo $name
		cp patch_new/$name .
	
done


