#!/bin/sh

# -------------------------------------------------------------------------------

# FileName:    check_mysql.sh

# Revision:    1.0

# Date:        2016/04/22

# Author:      tim

# Email:       mchdba@sohu.com

#MYSQL_SOCK="/usr/local/mysql/mysql.sock"

MYSQL_USER='zabbix'

MYSQL_PWD='zabbix'

MYSQL_HOST='127.0.0.1'

MYSQL_PORT='3306'

ARGS=1

if [ $# -ne "$ARGS" ];then

    echo "Please input one arguement:"

fi

case $1 in

    Uptime)

        result=`/usr/bin/mysqladmin  status|cut -f2 -d":"|cut -f1 -d"T"`

            echo $result

            ;;

        Com_update)

            result=`/usr/bin/mysqladmin  extended-status |grep -w "Com_update"|cut -d"|" -f3`

            echo $result

            ;;

        Slow_queries)

        result=`/usr/bin/mysqladmin  status |cut -f5 -d":"|cut -f1 -d"O"`

                echo $result

                ;;

    Com_select)

        result=`/usr/bin/mysqladmin  extended-status |grep -w "Com_select"|cut -d"|" -f3`

                echo $result

                ;;

    Com_rollback)

        result=`/usr/bin/mysqladmin  extended-status |grep -w "Com_rollback"|cut -d"|" -f3`

                echo $result

                ;;

    Questions)

        result=`/usr/bin/mysqladmin  status|cut -f4 -d":"|cut -f1 -d"S"`

                echo $result

                ;;

    Com_insert)

        result=`/usr/bin/mysqladmin  extended-status |grep -w "Com_insert"|cut -d"|" -f3`

                echo $result

                ;;

    Com_delete)

        result=`/usr/bin/mysqladmin  extended-status |grep -w "Com_delete"|cut -d"|" -f3`

                echo $result

                ;;

    Com_commit)

        result=`/usr/bin/mysqladmin  extended-status |grep -w "Com_commit"|cut -d"|" -f3`

                echo $result

                ;;

    Bytes_sent)

        result=`/usr/bin/mysqladmin  extended-status |grep -w "Bytes_sent" |cut -d"|" -f3`

                echo $result

                ;;

    Bytes_received)

        result=`/usr/bin/mysqladmin  extended-status |grep -w "Bytes_received" |cut -d"|" -f3`

                echo $result

                ;;

    Com_begin)

        result=`/usr/bin/mysqladmin  extended-status |grep -w "Com_begin"|cut -d"|" -f3`

                echo $result

                ;;

                       

        *)

        echo "Usage:$0(Uptime|Com_update|Slow_queries|Com_select|Com_rollback|Questions)"

        ;;

esac
