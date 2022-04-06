#!/bin/bash
key='blk'
mkdir $key
for file in dax/*;
do
		grep -q -i 'blk_dev' $file #revise -i
		if [ "$?" == 0 ]; then
			echo $file
			mv $file $key/.
	fi
		#rm -rf 1200/$c
done


