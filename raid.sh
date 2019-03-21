devname=md0
raidlevel=1
numberdisks=2
disk1=/dev/sdb
disk2=/dev/sdc

/usr/sbin/mdadm --zero-superblock --force /dev/sd{b,c}
/usr/sbin/mdadm --create --auto=yes /dev/$devname -l $raidlevel -n $numberdisks $disk1 $disk2 <<EOF
yes
EOF
