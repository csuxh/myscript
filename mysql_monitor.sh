#!/bin/sh


io_status = `mysql -uroot -pxiahang  -e "show slave status \G" | egrep 'Running|SQL_Delay' `
sql_status = `mysql -uroot -pxiahang  -e "show slave status \G" | egrep 'Running|SQL_Delay' 
# awk -F: '{print $1,$2}'



