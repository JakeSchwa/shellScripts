#!/bin/bash

website=""

read -p "Enter website please: " website
echo "looking into: "$website


cmd="host "$website" | head -n 1 | sed -n -e 's/^.*address //p'"
echo "results for: "$website>results.txt
echo "">>results.txt
echo "URL IP address-------------------------------------">>results.txt
echo "">>results.txt
eval $cmd>>results.txt
echo "">>results.txt

echo "DNS servers-----------------------------------------">>results.txt

cmd="whois "$website" | grep \"Name Server\" | sed -n -e 's/^.*Server: //p' | sort | uniq -i"

echo "">>results.txt
eval $cmd | xargs -L1 host>>results.txt

echo "">>results.txt
echo "Email servers----------------------------------------">>results.txt

echo "">>results.txt
eval $cmd | xargs -L1 host | sed -n -e 's/^.*address //p' | xargs -L1 nslookup -type=mx>>results.txt


cmd="whois "$website
echo "whois results-----------------------------------------">whoisresults.txt
eval $cmd>>whoisresults.txt

echo "recon complete"

