#!/bin/bash
#
cd /home/llewellyn
date +'%Y%m%d'> ./.bkupdate
date +'%T' > /var/log/lvbackups/backupLVSnaps_`cat ./.bkupdate`.log 2>&1

/bin/bash backupDhcp-b2.sh >> /var/log/lvbackups/backupLVSnaps_`cat ./.bkupdate`.log 2>&1

/bin/bash backupDhcp-g2.sh >> /var/log/lvbackups/backupLVSnaps_`cat ./.bkupdate`.log 2>&1

/bin/bash backupXenhost4.sh >> /var/log/lvbackups/backupLVSnaps_`cat ./.bkupdate`.log 2>&1

# finish
date +'%T' >> /var/log/lvbackups/backupLVSnaps_`cat ./.bkupdate`.log 2>&1


