dmesg: 打印或者控制内核，自动输出启动信息 dmesg > boot.msg
	-c: 打印输出内容后，清空缓存
	-r； 打印裸消息，不加前缀
	-s bufsize: 使用指定的大小，查询缓存，默认：16384
	-n level: 指定级别
查看命令的路径： which 命令 whereis locate find   ==whereis -b 
which: 搜索命令的执行路径，必须是PATH路径下，可执行文件
whereis:  
locate: 
	yum install mlocate 执行updatedb，更新数据库,不搜索/tmp
find path [option]
find 查找路径 -type f -name "name"
find 查找路径 -type f -name "name"   exec 命令{}   #找到指定的文件，并执行命令 {}是找到的命令
find 查找路径 -type f -name "name" | xargs -i mv {} {}.bak   #按行处理管道前面找到的文件,-i定义替代符号，默认{}
find 查找路径 -type f  -mtime +5 #5天前  
					   -mtime -5 #5天内
					  -num inode

ls -l: 长格式
	-R: 显示指定目录下的所有文件和目录 及其子目录下的所有文件
	-r: 反向显示
	-t: 按修改时间排序, 通常rt组合使用
	-h : 以人类可读的方式显示
	-i : 查看inodes
	-F/-p : 根据文件的类型不同，显示的结果不同
	-d: 显示目录
	-a: 显示所有的文件
	--color-auto: 显示颜色，系统中 ll
	以.开始的文件是隐藏文件
	ls 系统默认是别名： ls --color=auto
seq n: 生成序列n   
	-s '分隔符' n：以分隔符 ，横着显示序列
	firt 步长 last： c从first开始，以last结束； 相邻之间隔步长   相当于 echo {n,m}
type : 查看命令的类型，是否是命令还是内置
alias：  #m默认查看所有别名
	alias 别名=命令 #设置别名 
	unalias 别名：取消别名
	别名默认存在家目录的.bashrc
	防止误操作，危险命令
	改变复杂的字符串为简单的字符串
touch: 如果文件存在，只更改时间戳，不改变内容
cat:查看文件的内容
	-n: 显示行号
tac: 反转结果
lsmod:  列出模块
pwd:显示当前的路径
cp -a 源文件 目标文件： 复制文件或目录 #系统使用的命令是别名-i  
	复制不提示： \cp 或者 /bin/cp
	a: ==pdr
	p:保留属性
	r:递归复制目录
	n； 不覆盖目标文件
	注意：复制目录时，如果目录存在，则把源目录放到目标目录下
rename:更改文件名
diff : 文件比较
	-q: 只显示文件有无差异
	-c: 显示全部内文，并标记不同
	-b: 不检测空格字符
	-B: 不检测空行
	-r: 比较子目录中的文件
mv 源文件 目标文件:   移动或改名
	i：目标文件存在，询问
	f: 强制
	u:若目标文件存在，比源文件新，才更新
mkdir -p :  创建多个目录
rm 源文件： 
	r: 递归
	f: 删除不存在的文件，不显示错误
	使用/bin/rm删除文件时，也不提示，默认直接删除，系统rm = rm -i 
echo: 输出文本 ，默认自动换行
	-n: 不换行
	-e: 特殊字符起作用
	输出颜色： echo -e \033[40;25m .....\033[0m   #[前面是背景颜色(40-49)，后面是字体颜色(30-39)
grep：按行过滤
	--color=auto: 对过滤出来的内容显示颜色   *
	-E:可以在后面使用多个参数， 等价于egrep
	-i:不区分大小写
	-n: 显示行号
	-v "排除的字" a.txt  #显示除排除的字行之外的所有行
sed:
	sed -n n,mp 文件名    #获取文件的第n行到第m行
	sed -n /str/p #只打印包含str的行
	sed -n /^str/d #把以str开头的行删除
	sed -n /str/d #把包含str开头的行删除
	-n：默认不打印
	-i：更改文件，写入文件中
	"s/源字符串/目标字符串/g"  #把源字符串 全部更改为 目标字符串
	d: 删除全部匹配
	D: 删除首次匹配
	i：插入
	a: 附加
	p: 打印
stat : 查看文件的属性

head -n 文件：   #默认前10行
	显示前面n行
tail -n 文件：  #默认后10行
	 -f: 跟踪文件结尾的变化，删除文件然后再建立同名文件不可以继续查看
	 -F: 跟踪文件的实时变化，删除文件然后再建立同名文件依然可以继续查看
printf: 复杂的输出命令
	格式： printf "格式字符串" "参数"
tree: 查看目录结构
	-L: 设置深度
uname -a:　查看系统的版本
mknod: 创建块 或者字符设备
w：显示当前登录用户，同时显示在做什么
echo "hello,how are?" >> a.txt  单行文本追加
cat >> a.txt << 
...   #此处输入
OKDI  #把ESC之间的文本 多行追加到a.txt #ESC顶格写
cat > a.txt #多行写入，ctrl+d退出
cd -: 上个目录
	~： 家目录
vi/vim:编辑器，模式：命令(:wq!)<-->插入(esc)<-->普通([ioa])
	 98gg   #定位98行
>,>>: 重定向，数据流向
<,<<  #反向数据流
1：标准输出
0：标准输入
2: 错误输出
；：多个命令分隔符
/ :根或者路径的分隔
local ： 显示所有的字符集变量
uname : 打印系统信息
 halt： 关机

快捷键：
tab: 命令补全
ctrl+c: 终止当前进程
ctrl+d: 终止当前用户环境
ctrl+a: 当前行的行首
ctrl+e: 当前行的行尾
ctrl+r: 查找
ctrl+u: 清除光标前面的行、
ctrl+k: 清除光标后面的
ctrl+s: 锁定屏幕
ctrl+q: 解锁屏幕

！n: n为对应命令的行号 #执行对应行号的命令
!!:执行最近的命令
!str: 执行最近的以 str开头的命令
dff file1 file2 : 按行比较文件内容差别
vimdiff file1 file2: 可视化的编辑器比较
whoami: 显示当前登录到系统的用户
id : 查看当前用户UID,GID
非交互更改密码：
	echo "password" | passwd --stdin user
history -d num:　删除第num行
history -c :清空
netstat -i： 查看网络接口状态信息
yum grouplist ：查看以安装的包组
yum groupinstall "Development Tools"
rpm -e software_name   #卸载软件
rpm -ivh --rebuild name.src.rpm #安装以源码打包的软件 
df :
	-i : 显示inodes
~/.bashrc           #当前用户生效
~/.bash_profile      #当前用户生效
/etc/bash_profile      #所有用户生效
/etc/bashrc			  #所有用户生效

netstat #查看网络状态
	l #列表
	n #数字
	tu  #tcp udp 
	p #进程名
	--------------------上面或者下面
	an
lsof -i:n #n 表示端口

su - user: 把user用户的环境变量同时进行切换 ，需要root用户密码 #生产环境下没有此选择
sudo : 普通用户可以拥有指定的root权限        #
	sudo su - : 切换到root,不需要root密码，使用当前用户的密码
	sudo -l #查看当前拥有的权限
	配置： 
		visudo   #相当于修改/etc/sudoers    
		用户 机器=(执行命令的身份) 命令(全路径，逗号分隔)
					NOPASSWD:ALL  #使用sudo命令可以执行全部命令，不需要输入密码
		%组名
	执行后面的命令时，前面需要增加sudo

分区推荐： 
	/boot : 100M-200M
	swap： 1-2倍
	/ : 50G-100G
	/data:剩余
基本安全：
	1.基础知识
		尽量少让外人知道有关系统的信息(finger)
		日志是了解系统运行情况的唯一方法
		限制系统中SUID程序
	2. BIOS安全，设置引导口令
	3.设置安全策略
	4. 口令
		强制更改用户口令长度(/etc/login.defs): PASS_MIN_LEN
	5. 禁止使用控制台程序, 最好删除此目录下的文件
		目录：/etc/security/console.apps/service_name
		禁止所有控制台的访问：
			#!/bin/bash
			cd /etc/pam.d 
			for i in * ;do sed '/[^#].*pam_console.so/s/^/#/' < $i > foo && mv foo $i ;done
	6. TCP_WARPPERS: 允许或禁止所有的计算机访问本机，保护服务器的安全
		/etc/hosts.deny   ALL:ALL@ALL,PARANOID    #禁止所有的服务，访问位置，如果没有被明确允许就是被禁止
		/etc/hosts.allow   sshd: 192.168.1.1 contorller
						   #服务名  主机地址  主机名
		配置完成后，使用命令检测：tcpdchk
	7. 取消IP原路径路由   #包含到达目的地址的详细信息，RFC122目的主机必须按原路径返回IP数据
		for f in /proc/sys/net/ipv4/conf/*/accept_source_route;do
		echo 0 > $f
		done
		饭后语： 如果按照IPchains防火墙，就不必设置此项，已包含
	8. 删除系统中不必要的账号 和 组名
		userdel username
		groupdel groupname
	9. 禁止任何人都可以使用su 命令变成root用户
		auth            sufficient      /lib/security/pam_rootok.so debug
		auth            sufficient      /lib/security/pam_wheel.so group=wheel   #此处不可更改
		饭后语：加入以上语句后，限制用户使用su
		普通用户使用su:
			usermod -G10 username   #G表示用户使用的其他的组
	10. 限制用户对系统资源的使用，避免拒绝服务(/etc/security/limits.conf)
		* hard core 0      #禁止创建core文件
		* hard rss 50G     #其他用户最多只能使用5M的内存
		* hard nproc 20    #最多进程数限制到20
		饭后语：表示搜有登录到系统中的用户
		编辑/etc/pam.d/login , 末尾增加:
			session required /lib/security/pam_limits.so 
	11. 更好的控制mount上的文件系统(/etc/fstab):
		例： /dev/sda11 /tmp ext2 defaults 1 2
		defaults 可以改为Nodev: 不允许这个文件系统上有字符或特殊的块设备
						nosuid： 不允许设置文件的suid和sgid许可位
						noexec： 不允许文件系统上有任何可执行的二进制文件 
						noatime: 一般挂载文件增加此项， 不修改访问时间
	12. 移除rpm命令 和 yum, 不要卸载
			改变权限： chmod 700 /bin/rpm
	13. 家目录下存在.bash_history文件
		修改/etc/profile文件中:
			HISTFILESIZE=20
			HISTSIZE=20
	14. 禁止CTRL+ALT+DEL 关机：
		修改/etc/inittab
		#ca::ctrlaltdel:/sbin/shutdown -t 3 -r now
	15. 改变系统启动脚本的访问权限：
		chmod 700 /etc/rc.d/init.d/
	16. 取消登录系统的提示
		删除 /etc/issue 
		删除 /etc/issue.net 
	17. 查看系统中是否有异常和隐含文件
		find / -name ".." -print -xdev
		find / -name ".*" -print -xdev | cat -v 
	18. 查找所有SUID和SGID的文件：
		find / -type f \( -perm -04000 -o -perm -02000 \) -exec ls -lg {} \;
		find / -type f \( -perm -2 -o -perm -20 \) -exec ls -lg {} \;     #任何人都有写权限的文件
		find / -type d \( -perm -2 -o -perm -20 \) -exec ls -lg {} \;		# #任何人都有写权限的目录
		find / -nouser -o -nogroup   #查找没有用户 或者没有 用户组的文件
		find /home -name .rhosts     #查找。rhosts文件，不允许在系统中出现
网络优化：
	不更改最近的访问时间： chattr +A file_name   #对于文件的查找性能显著
	查看交换分区的速度： hdparm -t /dev/sda   
		编外话： 最好把交换分区放在硬盘的开始
	hdparm -i /dev/sda  #显示硬盘的信息，
	                             #允许多少钱I/O模式， XX为hdparm -i 查询中MaxMultSect值
	hdparm -d 1 -XX66 /dev/sda  #应该有支撑UltraDMA的芯片组，设置前千万千万小心

编译自己的内核：
	定制的内核运行速度更快
	系统将拥有更多的内存
	减少系统的漏洞
	将某种功能编译为模块方式比编译到内核的方式速度慢点








	安装最小化
	开启服务最小化
	操作最小化
	登录最小化，尽量不适用root
	权限最小化
	配置参数合理化

	隐藏登录界面上的提示：
		/etc/issue
	登录系统后显示提示：
		／etc/motd
	锁定关键的文件：
		chattr +i : 锁定
			   -i : 解锁
		查看内容是否加锁： lsattr
		更改chattr的文件名


	关闭selinux
		setlinux 0 : 关闭selinux,当前生效
		getlinux   : 查看selinux的当前生效的设置
	系统运行级别：
		runlevel : 当前运行级别
		init n: 切换到n级别，当前生效
		/etc/inittab:  修改启动运行级别
	精简开机启动：
		setup: 界面显示
		ntsysv: 直接调出服务设置界面
		查看开机启动服务：
		chkconfig: 查看设置开机自启动
			法一：for level in `chkconfig --list | grep "3:on" |  awk '{print $1}'`
				do 
				    chkconfig $level --level 3 off
				done 
				for level in crond network sshd ; do chkconfig $level --level 3 on;done 
			法二：推荐
				for level in `chkconfig --list | grep "3:on" |  awk '{print $1}' | grep -vE "crond|sshd|network|rsyslog"`
				do 
				    chkconfig $level --level 3 off
				done 
	测试环境下，可以关闭防火墙，生产环境需打开
	修改sshd(/etc/sshd/sshd_config):
		备份配置文件
		Port 22  #一般需要修改
		PermitRootLogin yes  #一般需要关闭no,禁止root通过ssh登录	
		PermitEmptyPasswords no  #no 不需要更改
		UseDNS no   #一般不需要,关闭加速ssh登录
		GSSAPIAuthentication no  #对客户端地址进行反向解析，关闭加速ssh，一般用于ssh-2
		重启sshd生效： /etc/init.d/sshd [reload|restart]
		注意：重启服务后，当前的连接依然生效，知道退出重新登录
    加大服务器文件描述符：
	配置文件： /etc/security/limits.conf 
		永久生效： echo "*     -   nofile   65535" >> /etc/security/limits.conf 
			命令：	
			cat >> /etc/rc.local <<  #EOF
				#open files
				ulimit -HSn 65535   #一般32768即可
				#stack size 
				ulimit -s 65535
				EOF

		查看： ulimit -n 


	调整内核参数：
		/etc/sysctl.conf 
		
系统变量：
	PATH  #系统命令的查找路径，包含在此变量中的所有目录下的命令，都可以直接使用命令
		echo 'PATH="path:$PATH"' >>/etc/profile  #下次开机依然生效，所有用户生效
	LANG  #字符集， 语言变量
		LANG=EN  #临时调整为英文

中文显示：
	语录：不推荐使用中文
	默认路径： /etc/sysconfig/i18n
	调整中文字符集，永久生效：
		修改配置文件/etc/sysconfig/i18n
		LANG="zh_CN.GB18030"
		生效： source  /etc/sysconfig/i18n
	修改字符显示：GBK(定长，双字节),UTF-8(非定长，1-4字节)
定时任务cron：
	配置文件 : /var/spool/cron
	-l  #显示所有的定时任务

时间同步NTP:
	ntpdate ntp-ip-address   #临时同步时间
	echo "*/5 * * * * /usr/sbin/ntpdate(`which ntpdate`) ntp-ip-address >/dev/null 2>&1 " >> /var/spool/cron/root #每5分同步一次

	基础优化：
		1. 添加普通用户，通过sudo授权
		2. 更改默认的远程连接SSH服务端口及禁止root登录
		3. 定时自动更新服务器时间
		4. 配置yum源，使用国内地址
		5. 关闭selinux和 iptables(有外网IP地址需要打开，高并发除外)
		6. 调整文件描述符的大小，进程及文件的打开都会消耗文件描述符
		7. 定时清理 /var/spool/clientmqueue目录下的垃圾文件，防止inodes被占满（sendmail产生的文件)
		8. 精简开机启动 
		9. linux 内核调优/etc/sysctl.conf 
		10. 更改文件字符集 
		11. 锁定关键文件
			chattr +i /etc/passwd /etc/group /etc/shadow /etc/inittab /etc/gshadow
		12. 清空/etc/issue

目录：
	分区与目录没有关系，通过挂载点访问分区 mount /dev/sda1 /var;不通的目录可以跨越不同的分区或磁盘
	目录：
		应用程序： /usr/bin
		数据文件、帮助： /usr/share
		配置文件： /etc/
		启动命令： /etc/init.d
		网卡： /etc/sysconfig/network-scripts/
			重启： service network restart #重启所有网卡
			重启： ipdown eth0 && ipup eth0  #重启指定网卡
		DNS配置： /etc/resolv.conf 
		主机名称,网关： /etc/sysconfig/network 
		本地解析： /etc/hosts
		开机挂载的文件系统： /etc/fstab
		开机自自动命令： /etc/rc.local
		启动级别及加载相关文件： /etc/inittab
		存放系统服务： /etc/init.d
		全局环境变量： /etc/profile 
		加载登录程序：  /etc/profile.
		安装文件： /usr/local   #相对于c:\program files
		内核源码存放： /usr/src 
		系统函数库： /usr/lib, /usr/local/lib
-----------------------------------------------------------
	/etc:
		issue: 记录系统登录前的显示信息
		motd： 登录后提醒
		redhat-release: 系统的版本    #uname - 内核版本
		useradd 命令修改下面文件：
			group: 组名和相关信息
			passwd: 账号相关信息
			shadow；密码相关信息
			gshadow: 组密码
		sudoers： 执行sudo的配置文件，此文件权限很重要
		securety: 那些终端可以让root登录
		login.defs: 所有用户登录的默认缺省配置
		moredprobe.conf： 内核模块的额外设置
		syslog.conf: 日志文件(5)
		rsyslog.conf: 日志文件(6)
		rc.local: 存放开机自启动内容的文件
		host.conf： #定义主机名怎样解析，告诉解析器(resolver)用什么服务，以什么顺序解析主机名
			order bind,hosts  #先查询DNS，后使用/etc/hosts文件
			multi on   #允许在/etc/hosts文件中出现的主机拥有多个IP地址
			nospoof on  # 执行不允许IP伪装
		services #端口号和标准服务的对应端口， chattr +i 防止被更改
		securetty #设置root用户可以从哪个TTY设备登录
	/var : 可变化的目录
		log/： 日志文件目录
		log/messages: 默认的系统日志文件，按周自动轮询
		log/secure: 存放登录信息(ssh) 
		log/wtmp;utmp: 登录记录文件  #last 命令查看用户的最后登录时间  lastlog: 显示所有用户的登录记录
		spool/cron/: 定时任务的目录文件
		spool/mail: 系统邮件目录
		spool/clientmqueue:  临时邮件文件目录，碎文件多，需要定时清理下
	/proc:   #虚拟文件系统 内核和进程
		version: 内核版本
		sys/kernel: 系统的内核功能
		sys/net/ipv4: 
		cpuinfo: 处理器的信息
		meminfo: 系统的内存信息
		devices: 当前运行内核的所有配置的设备
		dma: 当前正在使用的dma设备
		filesystems: 当前使用的文件系统
		interrupts:正在使用的中断　　和　曾经有多少中断
		ioports: 当前正在使用的io端口
		loadavg:　系统负载的平均值信息
		/proc/sys/net/ipv4/icmp_echo_ignore_all   #1 使系统对ping 没反应
		/proc/sys/net/ipv4/tcp_syncookies # 1 使系统拒绝SYN Attack攻击
		/proc/sys/net/ipv4、ip_forward   #1 允许IP转发

	相对路径：
	绝对路径：
	
文件： -
	文本文件：  纯文本文件，二进制文件 ，数据格式文件   #file 命令查看格式
目录：d  
块设备：　ｂ
字符设备:　ｃ
套接字: s
符号连接文件：  l
管道文件： p  pipe

分区，格式化，创建文件系统：
	tune2fs -m 1 /dev/sda4   #设置系统的保留的磁盘1% 的磁盘空间
	tune2fs -l /dev/sda1 #查看文件系统的详细
	tune2fs -r 2560 /dev/sda1   #调整文件系统的 Reserved blocked count的值
	inode:索引节点,存放文件的属性信息,不包含文件名 #文件名在上级目录的block
		   6的默认大小256
		    dumpe2fs /dev/sda1 | grep -i "Inode size"
		    df -i # 查看inode的总数量和使用数量
				-T: 查看文件类型
			du  -h: 人性化显示大小，带单位
				-s: 只查看目录
			ls -lb ： 显示的大小 == du -sb 显示的文件的大小
			du -h: 查看的占用磁盘空间的大小
			ls -h: 查看的文件的大小
			
	block: 存放实际数据，
		磁盘读取数据是按照block读取
		ext3/ext4:大小一般为1k,2k,4k,默认4k，引导分区(1k)等特殊分区除外
		dumpe2fs /dev/sda1 | grep -i "Block size"
		格式化文件系统： mkfs.exit4 -I inode_num -b block——size /dev/sdb
	一个文件： 至少一个inode 和 一个 block，多个文件占用同一个inode(硬连接)
	一个block只能被一个文件占用，无法继续被别的文件占用，浪费空间
	图： 通过文件名-- 找到innode，，查看是否有权限 -- 有 -- 查看blocks
												 -- 没有，退出
	一般情况下，block文件的数量大于inode数量
		查看数量： dumpe2fs /dev/sda |  grep "Block count" / "Inode count"
		查看大小： dumpe2fs /dev/sda |  grep "Block size" / "Inode size"

案例：
	1.企业100M的磁盘， 1k的文件能创建多少个？ 4k的文件能创建多少个？
	2. 使用 df -h 查看磁盘空间有剩余，但是无法创建新文件了？
		inode已使用完
		NO space left on device 
	3. 查找目录的一级目录(思想)
		通过颜色区分
		过了以d开头的文件  ls -l
		给目录做标示  		ls -F | grep /$
		find 查找类型是d  find ./ -type d  注意： find ./ --maxdepth 1 -type d ！ -name "."  #如果没有-depth参数，-prune也表示深入到多层
			-a 或 and : 表示与  ，默认
			-o 或 or : 或
			！ ： 表示非

		tree -Ld 1 : 页表示只显示目录
		ls -dl */
		ls -l | sed -n '/^d/p' #排除默认输出，打印以d开头的行
		ls -l | awk '/^d/ {print $0}'

cd - : 原理： 环境变量OLDPWD记录了上次的目录 ， env | grep -i
cd ..: 上一级目录
date -s "04/14/13" #设置当前日期为2013年4月14日
	测试实例： 
		for n in `seq 14`
		do 
			date -s "04/0$n/14"   #设置时间为14年04月
			touch access_www_`(date +%F)`.log
		done
	找出7天前的： find . -name "*.log" -type f -mtine +7 -exec rm -f {} \  或
				find . -name "*.log" -type f -mtine +7 -delete
显示文件的行号：
	cat -n file_name : 显示行号，包括空行
				-b: 显示行号，不包括空行
	nl file_name
	less -N file_name
	vi  :set nu
	grep -n file_name

开机自启动原理(chkconfig)： 
	在 /etc/rc.d/rcn.d/ 下面增加到 /etc/init.d/ 的软连接
	chkconfig sshd on : 增加 S55sshd
	chkconfig sshd off: 增加 K25sshd
	自己写的脚本加入开机自启动：
		chkconfig --add 程序名
		#！/bin/bash 
		#chkconfig: 2345 20 80     #2345为开机级别，20为启动的顺序，80为关闭的顺序
		#description: 
iftop:  实时监控网络
ethtool: 监控网络
统计TCP状态：
	ss -ant | awk 'NR>1 {++s[$1]} END {for (k in s ) print  k ,s[k]}'
	netstat -n |ａｗｋ　＇／^tcp/ {++stat[$NF] END {for (i in state) print key,state[key]}}
screen: 会话保持文档
	ctrl + a + d: 保存退出
	-ls: 列出会话
	-S name:  指定会话名称
nmon: 性能测试工具
nmon 分析工具： 
ssh：
	生成秘钥： ssh-keygen
	改变已生成私钥： ssh-keygen -p
	拷贝本机的公钥到需要访问的主机上：	
		scp ~/.ssh/*.pub  user_name@remote_ip:~/ssh/authorized_keys   #注意需要有权限访问
NFS文件共享服务：
	配置文件： /etc/exports  #不用通配符，不允许对根目录有写权限
	/data_share_path  host1_ip(ro,root_squash)
	共享目录 允许访问目录的主机 权限(ro:只读；root_squash:不允许对根目录进行写操作)
	服务生效： /usr/bin/exportfs -a 
	编外话： 存在安全隐患，不推荐在服务器上使用NFS

权限： 
	rwx-: read,write,execute,none
	ln: link
		不带参数，创建硬连接，具有相同索引节点(Inode)的不同连接
		-s: 创建软连接，定位源文件的绝对路径，找到源文件的inode,找到源文件的block。 ln -s 源文件 目标文件
		readlink: 打印连接文件的内容
		目录可以有软链接，不可以有硬连接
		目录本身有2个硬连接， 当前名称 和 .
		在目录里每创建一个目录，父目录的硬连接数自动加1， 子目录中的.. 指向父目录
	文件的删除原理，同时具备以下两个条件：
		文件的硬连接数： i_link, 当其为0时，就被删除，创建一个硬连接 i_link+1
		是否有进程占用此文件：  有一个进程占用，则i_count + 1, 当i_count=0时文件删除
帮助：
	man : 可以查看命令帮助 和 配置文件 
	命令 --help:
	help : 只输入help回车，显示所有的内置命令；查看内置命令的帮助
		-s: 显示内置命令的格式
	type: 查看命令的类型，是不是内置命令

开机时按ESC可以查看开机过程，而不是进度条
文件的三种时间：
	ls -ltuc  #分别显示三种时间
	ls --time-style=long-iso   #显示完整的时间
打开selinux, 创建文件是权限位最后会增加个.
<< 定时任务> 
/etc/cron.deny : 不允许用户使用crontab
/etc/cron.allow:  运行用户使用crontab,优先于cront.deny
每个定时任务都有日志： /var/log/cron
--------------------------------------------------------------------------------
	进程：运行在内存中的程序
	秒级的任务：
		1. 自己动手写 while
		2. * * * * * sleep 10; /bin/date 
		3. Quartz也可以实现

	系统定时任务(分为8段)：
		在/etc/cron*目录内，定时执行
		配置目录： /etc/logrotate.confs，/etc/logrotate.d 
	用户定时任务：
	了解 at: 一次性定时任务，突发性
			守护进程： atd
	了解 anacron: 适合非7*24开机的服务器准备，开机执行，检测停机期间没有执行的任务
	重点 crond： 用来定期执行命令或指定程序任务的服务，默认每分钟执行
			守护进程： crond 
	用户定时任务(分为6段)：
		每个列之间必须有一个空格。多个空格？
	crontab: 设置定时任务规则的命令
		*： 表示每，任意时间
		-： 表示时间范围 
		,:  表示分隔时间段
		/n:  n表示数字，表示每隔n
		定时任务的文件： /var/spool/cron
		-u:  指定用户
		-r:  移除当前的定时任务
		-e(常用):  编辑定时任务
		-i(interactive):  提示确认选择
		-l(常用)： 显示用户的定时任务 
		注意：
			如果是命令，并且有>> 符号，>/dev/null是不生效的
			写入时，尽量复制执行过的命令，而不是手动写，防止写入错误
			周和日 尽量不要同时使用，否则可能达不到想要的结果
			定时任务，必须写全路径，否则会到用户的家目录下
			文件结尾一般加： >/dev/null 2>&1， 否则小文件太大，容易沾满磁盘
			脚本一定要写注释： 什么人 什么时候  配置了什么信息
			定时任务执行时，会给系统发送邮件，默认sendmail关闭，堆积在/var/spool/clientmqueue,占用innode
			ls | xargs rm -f
			find * | xargs rm -f 
			删除上级目录，然后按照原来的权限 和用户、组创建
			专业的写法，先写入脚本然后通过脚本执行
			调试方法： 可以先改为每分执行，如果改变内容，或系统环境则在测试环境执行
	脚本规范：
		1. 规范脚本的存放目录
		2. 定时打包或处理其他工作，不要在屏幕输出。可以输出到日志文件
		3. 使用crontab中的命令测试，符合实际情况rgs
		4. 定时任务，不能使用%, 需要使用\转义
		5. 定时脚本 调用环境变量时，不识别，需要手动在脚本中增加环境变量
	注意：
		linux正则表达式不是每个命令都可以使用，一般是sed, awk, grep
		正则和命令行的通配符是有区别的
umask: 设置默认权限
	对于文件： 666 - umask
	对于目录： 777 - umask
	如果umask上面，存在奇数，再重新加 奇数
服务启动慢， 在/etc/hosts文件中解析主机名

ps axf : 查看进程的树型结构
<< 脚本排错> 
echo $SHLVL   	   #查看当前在哪个shell
echo $HOME	 	   #查看当前用户家目录
echo $PWD		   #显示当前的路径
bash -r 		   #bash的软连接，限制较多
bash -v script.sh  #显示出现错误的命令行
bash -n script.sh  #不执行代码
bash -x script.sh  #追踪代码的执行过程，查找逻辑错误
<< 用户登陆读取的配置文件> 
/etc/profile 
.bash_profile 
.bash_login
.profile 
<< 用户注销读取的配置文件> 
.bash_logout
<< 非登陆用户读取的配置文件>
/etc/bashrc
.bashrc
 << 脚本读取的配置文件>
BASH_ENV=
 << 用户相关>
 命令：
	 useradd: 增加用户
		-c comment: 注释栏
		-d home_dir: 登陆时的默认目录
		-g init_group:  指定用户的初始组
		-G group1,[..]: 指定多个不同的组
		-f inactivedays:  账号几日后永久停权，0：立即  -1：不使用
		-m: 创建家目录
		-M: 不创建家目录，优先于/etc/login.defs
		-s: 指定使用的shell
		-u uid: 指定用户UID，除非使用-o,否则不可为负值
		-e: 账号的终止日期，格式： MM/DD/YY 。 无法登陆用户，可以切换
			提示： your account has expired ,please your system administrators
		-D: 修改/etc/default/useradd文件
	 userdel: 删除用户，同时删除相关用户的配置和文件
		-r: 删除家目录
	 passwd : 修改用户密码, 不接任何参数直接修改当前用户的密码，可修改指定用户
		命令生成工具：mkpasswd    需要安装： yum install expect
			--stdin : 非交互式修改
				echo "123" | passwd --stdin root 
			-l : 锁定用户，无法修改
				passwd -l lizhen 
			-u : 解锁用户
				passwd -u lizhen 
			-S : 查看用户的状态信息
				[root@controller skel]# passwd -S root
				root PS 2015-07-14 0 99999 7 -1 (Password set, SHA512 crypt.)
			实例： lizhen用户7天内不能修改密码，60天后必须修改密码，过期前10天通知用户，过期30天禁止用户登陆
					passwd -n 7 -x 60 -w 10 -i 30 lizhen 
	 chage  : 修改密码的有效期限  
		-l user: 可查看用户有关时间的信息
	 usermod : 修改用户，登录名，家目录等
		对应useradd参数
		-L: 锁定用户
		-U: 解锁
	 id		: 查看用户的UID,GID，用户组
	 su  	: 用户切换
	 sudo   : 通过另一个用户执行指定的命令
	 visudo : 编辑sudo配置文件
	 finger : 查看用户信息
	以下可选：
	 pwcov  : 同步用户从/etc/passwd 到 /etc/shadow 
	 pwck   : 校验用户配置文件/etc/passwd , /etc/shadow是否合法和完整
	 pwuncov: pwconv的逆向操作
	 chfn   : 更改用户信息工具
	 chsh   : 更改用户登陆shell的工具
	 sudoedit: 和sudo功能差不多
 配置文件：
	/etc/skel:
		使用useradd增加用户时，默认把此文件下的所有文件拷贝到新用户的家目录下
		当需要对新加的用户 初始化时统一家目录下的文件，可在此添加
		实例：
			执行此命令：[lizhen@controller ~]$ rm -rf .*
			提示信息改变： -bash-4.1$ 
			重新改变回去： [root@controller skel]# cd /etc/skel && cp ./.* /home/lizhen/  ; chown -R lizhen /home/lizhen
	/etc/login.defs:
		配置用户密码期限和 相关信息的 默认文件
	/etc/default/useradd:
		使用useradd命令时，会调用此文件
		创建用户的初始目录， 批量更改时，修改此处
	在线用户管理：
		w: 谁登录系统 ，正在做什么，显示系统负载
		who: 谁登录系统
		last: 已登录过系统的用户，登录时间等
		lastlog: 最近系统用户登录信息
 <<  用户组相关的命令>
 groupadd : 增加用户组
	-g n: 指定GID
	可选：
		-r: 建立系统用户组
		-f: 强制建立组，覆盖已存在
 gpasswd  : 设置组密码
 groups   : 显示用户所属的用户组
 newgrp   : 更改当前用户所属的有效用户组
 以下可选：
 grpck    :
 grpconv  ： 通过/etc/group和/etc/gshadow 同步或创建/etc/gshadow 
 grpunconv: 通过/etc/group 和 /etc/gshadow 同步或创建/etc/group，删除/etc/gshadow
以普通用户执行命令：
	su - lizhen -c "/bin/ls /home/lizhen"
	sudo :
		时间戳位置： /var/db/username
		-l： 查看用户的权限
		-v: 验证时间戳
		-k: 删除时间戳
	/etc/sudoers:
		User_Alias ADMIN=
		Host_Alias SERS=
		Cmnd_Alias COMMAND=
		Runas_Alias OP=
	注意：别名大写， 命令路径写全路径 ， 超过一行用”\" 换行
配置sudo命令的日志审计：
	在/etc/sudoers:
		Defaults logfile=/var/log/sudo.log
	visudo -c : 检查语法
	/etc/rsyslog.conf:
		echo "local2.debug /var/log/sudo.log" > /etc/rsyslog.conf
	重启： /etc/init.d/rsyslog restart 
日志收集：
	flume
	scribe
	logstash,storm
特殊权限：
	sticky: 防删除位，只作用于目录，我的文件我做主
	suid 只对可执行二进制文件生效，典型例子 passwd 命令，作用是，让执行这个命令的用户临时以该文件所有者的身份去执行。
	sgid 可以作用在目录也可以作用在文件上，文件时也必须是可执行的二进制文件，作用是，让执行这个命令的用户临时以该文件所属组的身份执行，再说这个权限作用在目录时，会实现，任意用户在该目录下创建子目录或者子文件的属组都和该目录保持一致。
	
查看文件系统： /etc/filesystems
查看磁盘是否格式化： blkid  (df -T也可以，前提是已挂载)
挂载的方式：
	mount /dev/sda /dir
	mount LABEL=NAME /dir 
	umount -l /dir  #强制卸载
	mount -a : 自动挂载/etc/fstab中的所有
		  -o: 指定挂载选项
查找命令在哪个包下： yum provides exec_command
disk: 磁盘 head: 磁头  sector: 扇区  track:磁道  cylinder:柱面  units: 单元块 block：存储块  innode：索引
磁盘大小：
	512字节*扇区数/每磁道 = 一个磁道的大小
	512字节*扇区数*磁道数 = 一个盘面的大小
	512字节*扇区数*磁道数*磁头数 = 磁盘的大小 = 柱面数*柱面大小 = 磁道数*（磁道大小*磁头数） = 磁道数*磁头数*512字节*扇区数
	盘片数 * 2 = 磁头数

ping；
	-c: 次数
	-s: 包大小
	-i: 间隔时间
获取IP地址：
	ifconfig eth0 | awk -F "[ :]+" 'NR==2 {print $4}'
shell变量：
	env: 显示系统变量
	set: 显示所有的变量
	PS1： 提示符显示
cut: 截取文件
	-b: 指定字节长度
	-c: 指定字符长度
	-d:  指定分割符，默认是TAB键 
	-f: 选择段 n-m:表示到n端到第m端
	例：	cut -d : -f 1-2 /etc/password  #以:为分隔符，显示第一段和第二段得分数据
			cut -c 1-3 /etc/password       #显示 第一个字符到第三个字符
sort: 排序, 不加任何选项首字母向后，按照ASCII码依次排序，
	-u: 根据ASCCI码 排序去重
	-un: 根据数字去重，字母看做0
	-r: 逆序
	-o: 输出文件
	-r： 反转结果
	-d: 按字母排序
	-n: 按数字排序
	-t: 分隔符
	-kn1-n2: 指定区间
wc： 统计
	-l: 统计行数
	-w： 统计word数，以空白分割
	-c: 统计字符数
uniq -c: 计算重复的次数，不连续的不会计算
tr [a-z] [A-Z] : 替换成大写
数学运算: $[ $a + $b ]
read -t n -p "提示" user_input   #n为超时时间
位置参数: 内置变量 $1, $2.. $n
比较运算符： eq, gt, lt, 
判断文件类型, 权限, -n:是否不为空 -z:是否为空
split:
	-b:  按大小分割， 默认不带单位，也可以带单位
	-l:  按行分割
grep；
	--color: 匹配的使用特别的颜色显示
	-i: 忽略大小写
	-v: 取反
	-c: 统计行数
	-n: 显示行号
	-q: 只检测，不输出结果
	-A n : 下面的n 行
	-B n ： 上面的n 行 
	-C c ： 上下两行
	-r : 在目录下搜索， 不显示文件名-h
sed： 默认只改变输出，不改变原文件
	-n: 取消默认的显示
	-r: 不需要增转义符，使用正则表达式+（）|
	-i: 写入文件
	p: 打印输出
	d: 删除 
	1,2s/lizhen/& feng/g /etc/passwd  #把文件中lizhen的后面加 feng
	s/[a-z]//g  #删除小写字母 
	s/([a-z0-9])(:s)/\2\1/     #调换 前后的位置
	'/root/p; /lizhen/p'  #包含root 或 lizhen 
awk:
  内置变量：
	FS: 输入字段分隔符
	RS: 输入记录分隔符
	OFS:输出字段分割符,不支持花括号{}
	ORS:输出记录分隔符
	NR : 行号
	NF ：非空字段编号
  匹配：
	$1~/r*o/   #第一段匹配r*o
	$2=="root" || $7~/nologin/   # $2是root 或者  $7中包含nologin
	!= ,!~ , >= ,<=m ,< , >
  选项：
	-F: 指定分隔符
	-f awk_file: 从awk_file文件读取
	-v var=name: 设置变量
  实例：
	awk /str/ a.txt  #显示包含str的行
	awk "{if(NR>19&&NR<30) print $0}"
	
系统监控：
	w： 第一行 显示系统负载 < cat /proc/cpuinfo | grep processor
	vmstat : 查看proc, memory，swap, io , system, cpu 
		-a: 显示所有活动/不活动的 内存
	uptime: 系统负载
		n m : n秒显示1次，显示m次
	top: -d 1 -c 更详细 , 默认每3秒刷新一次
		shift M :根据内存排序
		-bn1: 一次显示所有的
	sar；
		sar -n DEV: 显示网卡流量，10分1次
		sar -n DEV 1 10 ： 1s 一次，显示10次
		-q: 历史负载
		-b: 查看磁盘 
		-p: CPU
	tcpdump -nn : 查看数据流，显示ip，而不是域名
			-c n ； 指定抓包数量
			-i eth1： 指定网卡
			port n: 指定端口
			tcp
			udp 
			and : 连接多个
			-w 1.cap :查看网卡流向
			-s0： 加此 抓取内容
	tshark 
		-n -t a -R http.request -T fields -e "frame.time" -e "ip.src" -e "http.host" -e "http.request.method" -e "http.request.uri"
		
备份MBR: dd if=/dev/sda of=mbr.bin bs=512 count=1  查看此文件命令： od -xa mbr.bin 
分区的实质： 修改0磁道1扇区的前面的446字节后面的64字节的分区进行设置，分区工具：fdisk(小于2TB) ， parted(大于2TB)		

iptables: nat,filter,mangle,raw
		-I INPUT/OUTPUT #之前，默认最前面
		-A INPUT/OUTPUT #之后，默认最后面
		-D 删除 
		-Z:计数重置为0
		-P INPUT DROP
		-p tcp/udp  -dport port 
		-s sourceip
		-t: 指定表
		-nvL: 查看 
		service iptables save #保存  
		iptables-save > ip.bak #备份
		iptables-restore < ip.bak #恢复
screen:
	ctrl+a+d : 后台运行screen
	-l： 查看运行的screen
	-S named: 给screen命名
	-r id: 进入指定的screen
	ctrl+d 或 esc：真正退出
curl:
	-I: 不看源代码
	-v: 查看过程
	-u username:passwd: 指定用户名密码
	-O: 下载、
	-A；指定useragent
	-o name : 下载
	-x ip:port : 代理
rsync:
	默认连接端口：873
	rsync [user]@remote_ip:/file_path /localfile #pull
	rsync /localfile [user]@remote_ip:/file_path
	rsync [user]@remote_ip::test_module/ /localfile
	-e"ssh -p port" == "--rsh=ssh -p"#使用ssh指定的端口
	-a: 综合选项
	-v: 输出详细信息
	-r: 针对目录
	-l: 同步软连接
	-L；同步连接文件的内容
	-z: 压缩
	--port 
	-p: 复制权限
	-t: 时间
	-g: 属组
	-D: 设备文件
	--delete:  删除已删除的文件
	--password-file=  #指定密码文件，只存密码
	--exclude: 排除 
	-P==--progress: 进度
	-u==--update: 更新 ，如果目标文件更新，则忽略
  守护：
	启动守护进程： rsync --daemon --config=:指定配置文件
	/etc/rsyncd.conf 
	port=port 
	log file=/
	pid file=/
	address   #监听地址
	[模块名]
	path=/tmp   #同步目录
	use chroot=[true|false]
	max connections=n  #最大连接数
	read only=[yes|no]  #只读
	list=yes #允许列出模块名
	uid=username
	gid=groupname  
	auth users=user #同步时的认证
	secret file=/file_path    #同步的用户的密码文件，username:password ,修改权限
	hosts allow=ip1,ip2     #允许连接主机
 
 LAMP:
	安装顺序： mysql->apache->php 
 apache:
	-l：查看工作模式
	-t: 测试配置文件是否正确
	-m: 列出模块
	httpd.conf:
		AddType application/x-httpd-php .php   #用来解析php
		DirectoryIndex index.php index.html    #增加php的索引页
	虚拟主机配置文件：							#用来设置访问某个目录时，需要认证
		<Directory /data/dir1/dir2/>			#针对某个目录限制
			AllowOverride AuthConfig
			AuthName "自定义"  #认证提示
			AuthType Basic
			AuthUserFile /data/.htpasswd
			require valid-user 
		创建认证密码文件： htpasswd -c /data/.htpasswd  #第一次,创建用户同时创建文件
					   htpasswd /data/.htpasswd     #以后不需要加 -c参数
	默认虚拟主机： 虚拟配置文件的第一个   # 此处可用于禁止默认的虚拟主机
	设置301域名跳转：
		<IfModule mod_rewrite.c>
			RewriteEngine on
			RewriteCond %{HTTP_HOST} ^www.domain1.com$  [OR] #条件1
			RewriteCond %{HTTP_HOST} ^www.domain3.com$		 #或条件3
			RewriteRule ^/(.*)$ http://www.domain2.com/$1 [R=301,L]#规则，domain1或domain3跳转到domain2,301永久重定向，域名一般用301，302临时；L：last结束
	日志切割：
		SetEnvIf Request_URI ".*\.gif$" image-request  #配置不记录的 指定后缀的文件
		CustomLog "!/usr/local/apache2/bin/rotatelogs -l /path_to_%Y_%m_%d.log 86400" combined env=!image-request #86400按时间切割
	配置缓存文件：
		<IfModule mod_expires.c>
			ExpiresActive on 
			ExpiresByTYpe image/gif "access plus 1 days"
			ExpiresByType application/x-shockwave-flash "now plus 2 hours"
			ExpiresDefault "now plus 0 min"
		</IfModule>
	配置防盗链：
		SetEnvItNoCase Referer "^http:.*\.yourdomain\.com" local_ref   #定义变量，自己的网站
		SetEnvItNoCase Referer ".*\.domain\.com" local_ref     #允许引用的网站
		<filesmatch "\.(txt|doc|mp3|zip|rar|jpg|ggif)">
			Order Allow,Deny
			Allow from env=local_ref     #设置白名单
		</filesmatch>
	禁止解析php文件：
		<Directory /data/www>
			php admin_flag engine off  #取消php解析引擎
			<filesmatch "(.*)php">     #禁止下载
			Order Deny,Allow
			Deny from all     #设置白名单
		</filesmatch>
	禁用User-Agent:
		<IfModule mod_rewrite.c>
		RewriteCond %{HTTP_USER_AGENT} ^.*curl* [NC,OR] #NC：不区分大小, 匹配
		RewriteRule  .* - [F]   #禁止
		</IfModule>
	不让用户看到某些文件：
		<IfModule mod_rewrite.c>
		RewriteCond %{REQUEST_URI} ^.*/tmp/.* [NC]
		RewriteRule  .* - [F]
		</IfModule>
php :
	-i 或 info.php: 包含曾经的编译参数
	php.ini配置文件：
		disable function : 禁用某些危险的函数
		display_errors=on  : 在浏览器上显示错误
		