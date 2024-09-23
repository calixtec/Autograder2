#!/bin/bash

ec="expected"
ac="actual"

rm -Rf ${1}  | true

bash -c "gcc -o ${1} ${1}.c"

ec="Hello world!"
ac=$(./${1})

if [[ ${ec} == ${ac} ]]; then
  echo "Test passes"
else
  echo "================== TEST OUTPUTS ================================="
  echo "${1} fails"
  echo "Expected: " ${ec}  
  echo "Actual:   " ${ac}
  echo "================================================================="
fi

