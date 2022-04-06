#!/bin/bash
#find data information and copy to tmp file
for file in loss_of_data/*;
do
#	echo $file
	#grep  '^Date:' $file #'data loss'
	grep  '^Date:' $file|cut -d " " -f 5 >> tmp
done

#loss of xxx such as metadata, data, 10350 738202
#storage capacity loss

