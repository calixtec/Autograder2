#!/bin/bash

ec="expected"
ac="actual"

rm -Rf ${1}.out  | true

bash -c "gcc -o ${1}.out ${1}.c"

mins=$(( $RANDOM % 1000 + 1 ))
h=$(( mins / 60 ))
m=$(( mins % 60 ))

ec="$h hours $m minutes"
ac=$(./${1}.out $mins)

if [[ ${ec} == ${ac} ]]; then
  echo "Test passes"
else
  echo "${1} fails"
  echo "Total minutes: " ${mins}
  echo "Expected: " ${ec}  
  echo "Actual:   " ${ac}
fi

rm -Rf ${1}.out
