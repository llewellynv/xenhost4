#!/bin/bash
# dhcp-g2 - root
/sbin/lvcreate -L10G -s -n dg2rootlvesnap /dev/hostvg1/dg2rootlve
/sbin/cryptsetup luksOpen /dev/hostvg1/dg2rootlvesnap dg2rootlvesnap --key-file /root/dg2r.key
/bin/mount /dev/mapper/dg2rootlvesnap /mnt/lvsnaps
/bin/tar -cpjvf /var/lvbackups/dg2rootlvesnap_`cat ./.bkupdate`.tar.bz2 /mnt/lvsnaps
/bin/umount /mnt/lvsnaps
/sbin/cryptsetup luksClose dg2rootlvesnap
/sbin/lvremove -f /dev/hostvg1/dg2rootlvesnap


