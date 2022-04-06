#!/bin/bash
#calculate numbers--patch size
for file in loss_of_data/*;
do
#	echo $file
	#grep  '^Date:' $file #'data loss'
	m=`grep '^--- ' $file|wc -l`
	a=`grep '^-' $file|wc -l`
	let s=a-m
	echo "- have $s"
        m2=`grep '^+++ ' $file|wc -l`
	a2=`grep '^+' $file|wc -l`
	let s2=a2-m2 
	echo "+ have $s2"
done

#loss of xxx such as metadata, data, 10350 738202
#storage capacity loss
#do not foget to remove documation patch
