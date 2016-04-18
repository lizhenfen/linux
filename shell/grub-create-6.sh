kernel=`ls /boot/ | grep "vmlinuz-\`uname -r\`"`
initfam=`ls /boot/ | grep "\`uname -r\`.img"`
root=`awk -F' ' '$2~"/$" { print $1}' /etc/fstab`
grub_conf="/boot/grub/grub.conf"

if [ `find /boot/ -name grub.conf -type f | wc -l ` -ne 0 ];then
  echo "grub.conf exists."
  exit 1
fi

cat >> $grub_conf <<EOF
default=0
timeout=5
#splashimage=(hd0,0)/grub/splash.xpm.gz
hiddenmenu
title CentOS (`uname -r`)
	root (hd0,0)
	kernel /$kernel ro root=$root rhgb quiet
	initrd /$initfam
EOF
if [ $? -eq 0 ];then
  echo "grub.conf has created"
  exit 0
else
  echo "some error occur"
  exit 3
fi
