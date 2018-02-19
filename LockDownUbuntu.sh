#!/bin/bash


read -p "Enter IP Adress: " ip
echo "Starting..."


#nmap scan------------------------------------
echo "running nmap..."
nmap="nmap -A -T5 -p- "$ip
echo "results for: " $ip>nmapResults.txt
echo "">>nmapResults.txt
eval $nmap>>nmapResults.txt
echo "nmap complete"
echo "">>nmapResults.txt


#netstat scan---------------------------------
echo "running netstat..."
netstat="netstat -tulpn "$ip
echo "netstat results for "$ip>netstat.txt
echo "">>netstat.txt
eval $netstat>>netstat.txt
echo "">>netstat.txt
echo "netstat complete"


#Change passwords for users----------------------------
echo "finding users..."
echo ""
sudo less /etc/passwd | grep -v bin/false | tr : " " | awk ' $3 >= 1000 || $3 == 0 ' | cut -d " " -f1 |	while read -r user ; do 
	echo "Changing Passwrod for $user"
	#passwd $user
	#echo root
	#echo root
done
echo ""
echo "found users"


#Update and Upgrade System-----------------------------
echo "updating system..."
sudo yes "yes" | apt-get update > /dev/null 2>&1
sudo yes "yes" | apt-get upgrade > /dev/null 2>&1
echo "update complete"
