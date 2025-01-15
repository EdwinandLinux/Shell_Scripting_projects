# List elements in of an Array

#!/bin/bash

MY_ARRAY=("web_1" "web_2" "web_3" "web_4")
COUNT=0
# Display elements of MY_ARRAY
for i in ${MY_ARRAY[@]} ; do 
     echo "${MY_ARRAY[COUNT]}"
     COUNT="`expr $COUNT + 1`"
done 