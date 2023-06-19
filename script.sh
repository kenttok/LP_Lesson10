#!/bin/bash
IP=`awk '{print $1}' /home/db/lesson10/access.log | uniq -c | sort -r`
URL=`egrep -o "htt(ps|p)://[a-z,A-Z,0-9,\.]*/" /home/db/lesson10/access.log | uniq -c | sort -r`
ERR=`egrep error /var/log/apache2/error.log`
CODE=`egrep -o "HTTP/1.1\" [1-5][0-9][0-9]" /home/db/lesson10/access.log | awk '{print $2}' | sort -n | uniq -c`
# cat /Users/dbeygul/Downloads/access.log >> /Users/dbeygul/Downloads/access.backup
# rm -f /Users/dbeygul/Downloads/access.log
# cat /var/log/apache2/error.log >> /var/log/apache2/error.backup
# rm -f /var/log/apache2/error.log
sendemail -f "kentastish@gmail.com" -t "leokil9321@gmail.com" -u "Отчет" -s "smtp.gmail.com:587" -o tls=yes -xu "kentastish@gmail.com" -xp "yxphwotbdmlgaasa" -m "IP \n" "$IP" "\nURL\n" "$URL" "\nCODE\n" "$CODE" "\nERROR\n" "$ERR"
