
	1.  dataĿ¼���������ļ��� 1-1.conf 1-2.conf 1.7.conf 
		��ȡiplist.txt�ļ��µ�ip�� �Ѷ�Ӧip�������ļ���������Ӧ������
		���磺
			10.0.1.1 ��Ӧ 1-1.conf
			10.0.1.2 ��Ӧ 1-2.conf
			10.0.1.7 ��Ӧ 1-7.conf
		ʵ����
			#!/bin/bash
			while read line
			do
			  filename=`echo $line | cut -d. -f3-4 | tr . -`.conf
			  scp $filename $line:/tmp
			done < iplist.txt
	2.  ��ǰĿ¼�´���20��û�й��ɵ��ļ�����iplist.txt�д���20��ip��ַ����20���ļ�ƽ���ַ���20��ip��ַ��
		#!/bin/bash
		i=1
		while read line
		do 
		  filename=`ls | head -n $i | tail -1`
		  /usr/bin/scp $filename $ip:/tmp
		  i=$(($i+1))

		done < /data/iplist