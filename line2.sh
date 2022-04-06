#!/bin/bash
#output patch size to a file
for file in loss_of_data/*;
do
#	echo $file
	#grep  '^Date:' $file #'data loss'
	grep '^--- ' $file
	grep '^+++ ' $file
done

#loss of xxx such as metadata, data, 10350 738202
#storage capacity loss

