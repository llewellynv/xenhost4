#!/bin/bash
#
cd /home/llewellyn
date +'%Y%m%d' > ./.rundate
date +'%T' > /var/log/lvbackups/testArchives_`cat ./.rundate`.log 2>&1

echo Checking archives in /var/lvbackups >> /var/log/lvbackups/testArchives_`cat ./.rundate`.log 2>&1

# Loop over all files in this folder
for file in /var/lvbackups/*.tar.bz2; do
    echo Checking.....$file >> /var/log/lvbackups/testArchives_`cat ./.rundate`.log 2>&1

    if ! tar tvfj $file &> /dev/null; then
        echo Archive corrupted. >> /var/log/lvbackups/testArchives_`cat ./.rundate`.log 2>&1
    else
        echo Archive OK.  >> /var/log/lvbackups/testArchives_`cat ./.rundate`.log 2>&1
    fi
done

# finish
date +'%T' >> /var/log/lvbackups/testArchives_`cat ./.rundate`.log 2>&1


