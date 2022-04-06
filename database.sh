#!/bin/bash
#used for building a patch database
#mkdir $key

#type='other' #revise

type='PM'
for file in $type/*; 
do
	echo $file
	#get date information
	year=`grep -m1 '^Date:' $file|cut -d " " -f 5` 
	echo $year >> tech.date
	time=`grep -m1 '^Date:' $file`

	key='files changed,'
	judge=`grep -e "${key}" $file`
	[ -z "$judge" ] && key='file changed,'
	
	#check line condition
	line=`grep -e "${key}" $file|cut -d ',' -f 3|cut -d ' ' -f 2`
	if [ -z "$line" ]; then
		linex=`grep -e "${key}" $file|cut -d ',' -f 2|cut -d ' ' -f 3`	
		if [[ $linex == "deletions(-)" ]]; then
			let line_add=0
			line_del=`grep -e "${key}" $file|cut -d ',' -f 2|cut -d ' ' -f 2`
		else
			if [[ $linex == "deletion(-)" ]]; then
				let line_add=0
				line_del=`grep -e "${key}" $file|cut -d ',' -f 2|cut -d ' ' -f 2`
			else
				let line_del=0
				line_add=`grep -e "${key}" $file|cut -d ',' -f 2|cut -d ' ' -f 2`
			fi
		fi		
	else 
		line_add=`grep -e "${key}" $file|cut -d ',' -f 2|cut -d ' ' -f 2`	
		line_del=`grep -e "${key}" $file|cut -d ',' -f 3|cut -d ' ' -f 2`
	fi
	#file_change=`grep -e 'files changed,' $file|cut -d ',' -f 1|cut -d ' ' -f 2`

	#show changed file key words may appear multiple times
	a=`grep -n -e "${key}" $file|tail -1|cut -d ':' -f 1`
	b=`grep -n -e '^---$' $file |tail -1|cut -d ':' -f 1`
	let x=a-1
	let y=a-b-1
	
	#file_add=`head -$x $file|tail -$y|grep -e '+'|wc -l`
	#file_del=`head -$x $file|tail -$y|grep -e '-'|wc -l`
	file_revised=`grep -e "${key}" $file|cut -d ',' -f 1|cut -d ' ' -f 2`
	#calculate other variable
	#head -$x $file|tail -$y|grep -e '+'|cut -d '|' -f 1 >> $type.add_file
	#head -$x $file|tail -$y|grep -e '-'|cut -d '|' -f 1 >> $type.del_file
	#file_name_add=`head -$x $file|tail -$y|grep -e '+'|cut -d ' ' -f 2|tr '\n' ' '`
	#file_name_del=`head -$x $file|tail -$y|grep -e '-'|cut -d ' ' -f 2|tr '\n' ' '`
	file_name_revise=`head -$x $file|tail -$y|cut -d ' ' -f 2|tr '\n' ' '`

	#calculate module
	#c= `grep -e ' \.\.\.' $file`
	#if [ -z "$c" ]; then
	module=`head -$x $file|tail -$y|cut -d ' ' -f 2|cut -d '/' -f 1|sort |uniq -c|cut -d ' ' -f 8|tr '\n' '.'`
	#echo $module >> $type.module	
	#else
	#	module=`head -$x $file|tail -$y|cut -d ' ' -f 2|cut -d '/' -f 2|sort |uniq -c|cut -d ' ' -f 8|tr '\n' '.'` 
	#fi
	
	#echo $file,$year,$time,$module,$line_add,$line_del,$file_add,$file_del,\"$file_name_add\",\"$file_name_del\",$type >>tech.csv 
	name=`echo $file|cut -d '/' -f 2`
	echo $name,$year,$time,$module,$line_add,$line_del,$file_revised,\"$file_name_revise\",,$type >>tech_PM.csv 
done

sort -n tech.date|uniq -c > $type.date_total
#cat $type.add_file|cut -d ' ' -f 2|sort -n|uniq -c > $type.add_file_total
#cat $type.del_file|cut -d ' ' -f 2|sort -n|uniq -c > $type.del_file_total



