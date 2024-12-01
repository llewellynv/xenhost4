#!/bin/bash
#
VERSIONS="5"
cd /home/llewellyn
date +'%Y%m%d'> ./.bkupdate
date +'%T' > /var/log/lvbackups/cleanupLVSnapFiles_`cat ./.bkupdate`.log 2>&1

/bin/bash cleanupFiles.sh /var/lvbackups hsboot $VERSIONS >> /var/log/lvbackups/cleanupLVSnapFiles_`cat ./.bkupdate`.log 2>&1

/bin/bash cleanupFiles.sh /var/lvbackups hsrootlvsnap $VERSIONS >> /var/log/lvbackups/cleanupLVSnapFiles_`cat ./.bkupdate`.log 2>&1

/bin/bash cleanupFiles.sh /var/lvbackups db2rootlvesnap $VERSIONS >> /var/log/lvbackups/cleanupLVSnapFiles_`cat ./.bkupdate`.log 2>&1

/bin/bash cleanupFiles.sh /var/lvbackups dg2rootlvesnap $VERSIONS >> /var/log/lvbackups/cleanupLVSnapFiles_`cat ./.bkupdate`.log 2>&1

# finish
date +'%T' >> /var/log/lvbackups/cleanupLVSnapFiles_`cat ./.bkupdate`.log 2>&1


