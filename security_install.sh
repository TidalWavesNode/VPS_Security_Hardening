#!/bin/bash

# Update and upgrade Ubuntu
echo "Updating and upgrading Ubuntu..."
apt-get update && apt-get upgrade -y

# Set password requirements
echo "Setting password requirements..."
sed -i 's/password.*requisite.*pam_pwquality.so.*/password requisite pam_pwquality.so minlen=8 minclass=0 lcredit=0 ucredit=0 dcredit=0 ocredit=0 dictpath=\/dev\/null/' /etc/pam.d/common-password

# Create a new user
echo "Creating a new user..."
read -p "Enter the new username: " new_user
adduser $new_user
usermod -aG sudo $new_user

# Disable root SSH login
echo "Disabling root SSH login..."
sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config

# Change SSH port
read -p "Enter the new SSH port: " new_port
sed -i "s/#Port 22/Port $new_port/" /etc/ssh/sshd_config

# Install Google Authenticator
echo "Installing Google Authenticator..."
apt-get install -y libpam-google-authenticator

# Configure Google Authenticator
echo "Configuring Google Authenticator for the new user..."
su - $new_user -c "google-authenticator"

# Enable Google Authenticator
echo "Enabling Google Authenticator in SSH PAM configuration..."
echo "auth required pam_google_authenticator.so" >> /etc/pam.d/sshd
sed -i "s/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/" /etc/ssh/sshd_config

# Install UFW (Uncomplicated Firewall)
echo "Installing UFW..."
apt-get install -y ufw

# Configure UFW
echo "Configuring UFW..."
ufw allow $new_port/ssh
ufw enable

# Install Fail2Ban
echo "Installing Fail2Ban..."
apt-get install -y fail2ban

# Configure Fail2Ban
echo "Configuring Fail2Ban for SSH..."
cat > /etc/fail2ban/jail.local <<EOF
[sshd]
enabled = true
port = $new_port
filter = sshd
logpath = /var/log/auth.log
maxretry = 3
bantime = 86400
EOF

# Restart services
echo "Restarting SSH and Fail2Ban services..."
systemctl restart ssh
systemctl enable fail2ban
systemctl start fail2ban

echo "All tasks completed successfully!"
