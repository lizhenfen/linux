
	1.  data目录下有配置文件： 1-1.conf 1-2.conf 1.7.conf 
		读取iplist.txt文件下的ip， 把对应ip的配置文件拷贝到对应主机上
		例如：
			10.0.1.1 对应 1-1.conf
			10.0.1.2 对应 1-2.conf
			10.0.1.7 对应 1-7.conf
		实例：
			#!/bin/bash
			while read line
			do
			  filename=`echo $line | cut -d. -f3-4 | tr . -`.conf
			  scp $filename $line:/tmp
			done < iplist.txt
	2.  当前目录下存在20个没有规律的文件名，iplist.txt中存在20个ip地址，把20个文件平均分发到20个ip地址上
		#!/bin/bash
		i=1
		while read line
		do 
		  filename=`ls | head -n $i | tail -1`
		  /usr/bin/scp $filename $ip:/tmp
		  i=$(($i+1))

		done < /data/iplist