#!/bin/bash
#
VERSIONS="6"
cd /home/llewellyn
date +'%Y%m%d'> ./.rundate
date +'%T' > /var/log/lvbackups/cleanupLVBackupLogFiles_`cat ./.rundate`.log 2>&1

/bin/bash cleanupFiles.sh /var/log/lvbackups backupLVSnaps $VERSIONS >> /var/log/lvbackups/cleanupLVBackupLogFiles_`cat ./.rundate`.log 2>&1

/bin/bash cleanupFiles.sh /var/log/lvbackups cleanupLVSnapFiles $VERSIONS >> /var/log/lvbackups/cleanupLVBackupLogFiles_`cat ./.rundate`.log 2>&1

/bin/bash cleanupFiles.sh /var/log/lvbackups testArchives $VERSIONS >> /var/log/lvbackups/cleanupLVBackupLogFiles_`cat ./.rundate`.log 2>&1

/bin/bash cleanupFiles.sh /var/log/lvbackups cleanupLVBackupLogFiles $VERSIONS >> /var/log/lvbackups/cleanupLVBackupLogFiles_`cat ./.rundate`.log 2>&1

# finish
date +'%T' >> /var/log/lvbackups/cleanupLVBackupLogFiles_`cat ./.rundate`.log 2>&1


