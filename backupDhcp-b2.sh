#!/bin/bash
# dhcp-b2 - root
/sbin/lvcreate -L10G -s -n db2rootlvesnap /dev/hostvg1/db2rootlve
/sbin/cryptsetup luksOpen /dev/hostvg1/db2rootlvesnap db2rootlvesnap --key-file /root/db2r.key
/bin/mount /dev/mapper/db2rootlvesnap /mnt/lvsnaps
/bin/tar -cpjvf /var/lvbackups/db2rootlvesnap_`cat ./.bkupdate`.tar.bz2 /mnt/lvsnaps
/bin/umount /mnt/lvsnaps
/sbin/cryptsetup luksClose db2rootlvesnap
/sbin/lvremove -f /dev/hostvg1/db2rootlvesnap


