#!/bin/bash
IP=`awk '{print $1}' /home/db/lesson10/access.log | uniq -c | sort -r`
URL=`egrep -o "htt(ps|p)://[a-z,A-Z,0-9,\.]*/" /home/db/lesson10/access.log | uniq -c | sort -r`
ERR=`egrep error /var/log/apache2/error.log`
CODE=`egrep -o "HTTP/1.1\" [1-5][0-9][0-9]" /home/db/lesson10/access.log | awk '{print $2}' | sort -n | uniq -c`
ABE=`head -n 1 /home/db/lesson10/access.log | egrep -o "[0-9]{2}/[A-Z][a-z]{2}/[0-9]{4}":[0-9]{2}:[0-9]{2}:[0-9]{2}`
AEN=`tail -n 1 /home/db/lesson10/access.log | egrep -o "[0-9]{2}/[A-Z][a-z]{2}/[0-9]{4}":[0-9]{2}:[0-9]{2}:[0-9]{2}`
EBE=`head -n 1 /var/log/apache2/error.log | awk '{print $1,$2,$3,$4}'`
EEN=`tail -n 1 /var/log/apache2/error.log | awk '{print $1,$2,$3,$4}'`
cat /home/db/lesson10/access.log >> /home/db/lesson10/access.backup
rm -f /home/db/lesson10/access.log
cat /var/log/apache2/error.log >> /var/log/apache2/error.backup
rm -f /var/log/apache2/error.log
sendemail -f "kentastish@gmail.com" -t "leokil9321@gmail.com" -u "Отчет" -s "smtp.gmail.com:587" -o tls=yes -xu "kentastish@gmail.com" -xp "yxphwotbdmlgaasa" -m "AcessLog Time:" "$ABE-$AEN"  "\nErrorLog Time: $EBE-$EEN" "\nIP\n" "$IP" "\nURL\n" "$URL" "\nCODE\n" "$CODE" "\nERROR\n" "$ERR"
