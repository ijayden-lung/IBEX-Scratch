#!/bin/bash

bak_to_dir_par="/ibex/scratch/longy/.bak/"


find /ibex/scratch/longy/ -depth  -name "*\.pl" -or -name "*\.r" -or -name "*\.sh" -or -name "*\.py"  -or -name "*\.R" -or -name "*\.ipynb" | grep -E -v "localperl|perl5|anaconda2|.local|apps" | while read line
#find ~ -depth  -name "*\.src" | while read line
do
	bak_dir=${line%/*}
	bak_dir=${bak_dir#*/}
	bak_dir=${bak_dir#*/}
	bak_dir=${bak_dir#*/}
	bak_dir=${bak_dir#*/}  #####Four /
	bak_dir="${bak_to_dir_par}${bak_dir}"
	file=${line##*/}
	suffix=${file##*.}
	bak_file="${bak_dir}/${file}.$(date +%Y%m%d%H).$suffix"

	if [ ! -d $bak_dir ];then
		mkdir -p $bak_dir
	fi

	md5_sum_file="${bak_dir}/${file}.md5"

	if [ ! -f "$md5_sum_file" ]; then
		  touch "$md5_sum_file"
	fi

	new_md5_sum=`find $line |xargs -I {} md5sum {}  2>/dev/null | awk '{print $1}'`
	old_md5_sum=`awk '{print $1}' $md5_sum_file`
	if [ "$new_md5_sum" != "$old_md5_sum" ];then
		echo $new_md5_sum >$md5_sum_file
		cp $line $bak_file
	fi

done
cd /ibex/scratch/longy/.bak/
git pull -u origin master
git add .
git commit -m "update"
git push -u origin master
