#!/bin/bash

ec="expected"
ac="actual"

rm -Rf ${1}.out  | true
rm -Rf rand.txt | true

bash -c "gcc -o ${1}.out ${1}.c"

touch rand.txt
for ((i=0; i<10; i++))
do
  echo $(( $RANDOM % 20 + 1)) >> rand.txt
done

sum=0
product=1
while read line
do
  ((product *= $line))
  ((sum += $line))
done < rand.txt
echo $sum > expected.txt
echo $product >> expected.txt
./${1}.out rand.txt > result.txt

ec="Files expected.txt and result.txt are identical"
ac=$(diff -s expected.txt result.txt)

if [[ ${ec} == ${ac} ]]; then
  echo "Test passes"
else
  echo "${1} fails"
  echo "Numbers: " 
  cat rand.txt
  echo "Expected: " 
  cat expected.txt  
  echo "Actual:   "
  cat result.txt
fi

rm -Rf ${1}.out rand.txt expected.txt result.txt
