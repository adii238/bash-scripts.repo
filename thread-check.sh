#!/bin/ksh
# Script is used to check and report thread count
set -x
MAIL_LIST="test@test.com"
APPL=WEBSEAL
DATE=`date`
echo "######################$DATE##################">>/usr/scripts/Application_Report.doc 
/usr/bin/xadmin -a sec_master -p 'password' server task portalweb-webseald-po 
rtalweb4.standard.com stats get pdweb.threads>/usr/scripts/thread_count.out
cat /usr/scripts/thread_count.out >>/usr/scripts/Webseal_Report.doc
thread_chk() {
i=`head -1 /usr/scripts/thread_count.out|awk '{print $3}'`
if [ $i -ge 200 ];
then 
echo "Thread Count Exceeded The Set Limit `head -1 /usr/scripts/thread_count.out                                                           
|awk '{print $3}'`"|mailx -s "Thread Count Exceeded for $APPL  on `uname -n`, Please look into it asap" $MAIL_LIST
else
echo "All Looks Good"
fi}
thread_chk
