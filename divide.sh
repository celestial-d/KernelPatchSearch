#!/bin/bash
#revise

for i in {1..41}
do
	mkdir $i
	ls |sort -R|tail -200 |while read file; do
		echo $file
		mv $file $i/.
	done
done

