#!/bin/bash

# Update and upgrade the system
sudo apt update && sudo apt upgrade -y

# Install necessary packages
sudo apt install -y ufw fail2ban unattended-upgrades google-authenticator

# Configure SSH
SSH_PORT=2222 # Choose a custom port for SSH
sudo sed -i "s/#Port 22/Port $SSH_PORT/" /etc/ssh/sshd_config
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

# Configure UFW (Uncomplicated Firewall)
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow $SSH_PORT/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable

# Configure Fail2Ban
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo sed -i "s/port     = ssh/port     = $SSH_PORT/" /etc/fail2ban/jail.local

sudo systemctl enable fail2ban
sudo systemctl restart fail2ban

# Configure unattended-upgrades
sudo dpkg-reconfigure --priority=low unattended-upgrades

# Set up Google Authenticator
echo "Now setting up Google Authenticator."
google-authenticator

# Update PAM to use Google Authenticator
sudo sh -c 'echo "auth required pam_google_authenticator.so" >> /etc/pam.d/sshd'

# Enable two-factor authentication in SSH
sudo sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/UsePAM no/UsePAM yes/' /etc/ssh/sshd_config

# Restart SSH service
sudo systemctl restart sshd

echo "Script completed. SSH port changed to $SSH_PORT, Google Authenticator and other security measures are now in place."
echo "Please ensure you have scanned the QR code and saved your emergency scratch codes before logging out."

