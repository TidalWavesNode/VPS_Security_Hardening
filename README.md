# VPS_Security_Hardening
This script implements several security related configurations meant to harden the security stance of a new server
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
1. Updates and upgrades Ubuntu OS
2. Creates a new user with sudo privileges (min password requirement to 8 characters)
3. Disables root SSH login
4. Changes the SSH port (user prompted to enter new ssh port)
5. Installs and configures Google Authenticator for 2FA (answer y, scan the qr code and enter the code from the app, y, y, n, y for the prompts and save your emergency scratch codes)
6. Installs and configures UFW (Uncomplicated Firewall)
7. Installs and configures Fail2Ban to protect against brute-force attacks on the SSH service

Please note that this script is provided as a reference, and you should review and adapt it to your specific needs and requirements before using it in a production environment.

# Vultr referal links
This link should give you $100 credit
````
https://www.vultr.com/?ref=9260952-8H
````

TIPS:
LYXe - 0xEe8Fe0986857Ac7357C39C66701DeFDcCF156ddc
