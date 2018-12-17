#!/bin/bash
#echo "\$?" = $?
#echo `date`
#echo $0
#echo $1
#echo $#  $* $$

#for ((i=$1; i<10; i++))
#do 
#echo $i 
#done

num=18	
#整型 -lt, -gt, -ge, -le, -eq, -ne 
# =:  ,  -z , != 
while [ $num -lt 20 ]
do
  echo -n  $num
 let num=$num+1
done

if [ -z $1 ]
then 
  echo no input
else 
  echo "input value is: $1"
fi

if [ -z $1 ];then echo no input
elif [ $# -eq 2 ]; then  echo "2 input values"
elif [ $# >  3 ]; then echo "3 input values"
else echo "more than 3 values"
fi




