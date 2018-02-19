LockDownUbuntu------------------------------------
This Script is used to secure a vulnerable Ubuntu machine.
It does the following:
1.	Runs nmap on all ports of the machine and prints results to nmapResults.txt
2.	Runs netstat on all ports and prints results to netstat.txt
3.	Changes passwords for all users that are not associated with applications.
4.	Updates the system with apt-get update.


Users----------------------------------------------------
This script prints all users on the host machine that are not associated with an application. It prints them to the command line.


Recon--------------------------------------------
This script is used to gather information on the domain name, related DNS servers, related email servers, and the host of the domain name.
The script does the following things.

1.	Askes for a domain name.
2.	Gathers all extensions of the domain name and the associated IP addresses. Prints them to results.txt.
3.	Gathers DNS servers and their IP addresses that are associated with the domain name. Prints to results.txt
4.	 Gathers Email servers and their IP addresses that are associated with the domain name. Prints to results.txt
5.	Runs whois command on the domain name and prints the results to whoisresults.txt.

