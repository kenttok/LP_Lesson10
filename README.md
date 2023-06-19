В файл /etc/crontab добавляем строку 
0 * * * * root /usr/bin/flock -xn /var/lock/import.lock -c 'sh /home/db/lesson10/script.sh'

Благодаря /usr/bin/flock -xn /var/lock/import.lock реализуется механизм предотвращения запуска нескольких копий скрипта
Содержимое скрипта в файле script.sh
