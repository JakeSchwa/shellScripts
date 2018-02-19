#!/bin/bash

echo "finding users..."
echo ""
sudo less /etc/passwd | grep -v bin/false | tr : " " |
	awk ' $3 > 1000 || $3 == 0 ' |	while read -r line ; do 
	echo $line | cut -d " " -f1
done
echo ""
echo "found users"