# VPS_Security_Hardening
This script implements several Security related industry best practices to harden a new server

Installation:
Log into the server using ssh (Putty for windows or terminal for Mac users) and run the following commands:

wget -q https://github.com/TidalWavesNode/VPS_Security_Hardening/blob/main/security_install.sh
<br>
bash security_install.sh

This is a script that will update and upgrade your Ubuntu OS, secure the VPS with a custom SSH port, two-factor authentication using Google Authenticator, implement a firewall using UFW, Fail2Ban, and it disables remote root login.

Before running the script, make sure you have a backup of your system and can access the VPS through other means in case something goes wrong.

Vultr referal links

This link should give you $100 credit
https://www.vultr.com/?ref=9260952-8H

