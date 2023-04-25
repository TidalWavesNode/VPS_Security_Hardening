# VPS_Security_Hardening
This script implements several Security related industry best practices to harden a new server
***

# Installation:
Log into the server using ssh (Putty for windows or terminal for Mac users) and run the following commands:
````
wget -q https://raw.githubusercontent.com/TidalWavesNode/VPS_Security_Hardening/main/security_install.sh
````
````
bash security_install.sh
````
***

This script performs the following tasks:

Updates and upgrades Ubuntu.
Creates a new user with sudo privileges.
Disables root SSH login.
Changes the SSH port.
Installs and configures Google Authenticator for 2FA.
Installs and configures UFW (Uncomplicated Firewall).
Installs and configures Fail2Ban to protect against brute-force attacks on the SSH service.

Please note that this script is provided as a reference, and you should review and adapt it to your specific needs and requirements before using it in a production environment.

# Vultr referal links
This link should give you $100 credit
````
https://www.vultr.com/?ref=9260952-8H
````
