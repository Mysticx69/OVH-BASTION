#!/bin/bash
# Script to add SSH public keys to the ubuntu user

# Create .ssh directory if it doesn't exist
mkdir -p /home/ubuntu/.ssh
chmod 700 /home/ubuntu/.ssh

# Add public keys to authorized_keys file
cat <<EOT >> /home/ubuntu/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDP8WwUWo5u/XA7uP0jXbDQKKdfpcjph35jsCTe3znWZeDa2AQjGEXVaBib3l920+C+fxwlXWgpJmZQvxFv4SO3fIlxLyEZ1CJT0Iwi8nd8qO8iKRxNJaIBuzDGtVTGG49OckylCoVRdQ35sGoPmL0hxAh45Ge42QkFIya/i05Jhd37++9+DzEuHmgruOrP0qnWzi9bXRUFkG4j2ivimzI8u5UjppOKs3QOBR3jGJvJOAax9r/zmj/7QqECs121C9jU3FYWhwB9M0BrjUm5n6MbPIfMOSXvDP4fiuIVmQ2lhtexNVfvlw50mxV42ADwTx32DYqi8CZw3paSJcFGk7B9jOEF9egZ6OkhRwnQNBpx3AFfccCLXGwtTCncvunxHhQQYWaEGv0LErwPebwxOz797w2RpmH8esay48Uft/2JTKZUSY4XXQwZ0ll35ejfLBMP8ogskItq0mxdWhbCYMA7Deki/GqBcWP4Scfab2xzQYFnfXoKZZAvzL2i2n9hA5M= user@DESKTOP-15D6K43
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDGvP6FNwz02vxPq08WYwyyFIuoAjH3GgD1f0dNLuymqMIMKCf/LXHysEk0RO+Qpbk6JDDazRMfMtPHvT9wugottQ6VCRcLA9IFJF9vE984VXnqbK53oFX9zDlahF0cvI8eiJIrrfj6esRFrm+wGDguQI/Fusk/rl+Bsax14ebC3q6O1KreVBQ4zQ4Qsv5IJ713tklsqFDhejMn8CMEqo4QGYXD5+l5l7qhG40cDgmu5yIeomzmgrkp9gmezvDNMLreyOfwTdQCpXKP/piwxsrcE+yGFMneFcH25XQo0HHGUQZFNROQhUHCeUCT02re7yR16ClBMuZsuh7IyD5Vvp3Zo2xDsoDPenM7NjN07sU/H1fwmiLKnXWvDru2FPmBIBM1ttyYzxHJHeA1Cj7gbly3BvnO/3keRrP0QrUKMqltqjGuWwnu7AUNL0qb1Tnw6GQwzS5XPNdVaonuM37MBtqP1EPoaXBqZEDtD/xBouBWI+4f1eAotklOHK3wOZgEJU0= sah0428@sah4lpt20
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDrqK0NDtX3JFWu+8xYWe1+98hCqiw2nMdrUw0y2AbJn+pY022N3iLR5t/4ONk5IP2Q+WbYAHV3p03xHwVxILWB4A5XMXaU32g+lnfWk8ccZVI0ct1uUKRzVuSvRhgykD1Wtc4AVgd2BaCcpmEjCLnRzIMqQrCSWopeRBVrmBjW8weKLqYBVYLzPyDHQOwvzoRUGnDNclEoHi61yrfTX8El9P0jksY/k3PFQ1k4Pp3HaiY1PjOzmcbEk+/w14Yfmjl8SAo7HcsrHS7d71heUZv4RSXikfrmWLGks2MvR3/BRaMBtBC36/aNHS7ugt92nouiVy7++kDYuuz4VY2rosb9
FGL@DESKTOP-2LS9O12
EOT

# Set correct permissions and ownership
chmod 600 /home/ubuntu/.ssh/authorized_keys
chown ubuntu:ubuntu /home/ubuntu/.ssh/authorized_keys

sudo apt update
sudo apt upgrade -y

# Configure DNS
echo "nameserver 8.8.8.8" | sudo tee -a /etc/resolv.conf > /dev/null
echo "nameserver 8.8.4.4" | sudo tee -a /etc/resolv.conf > /dev/null

# Switch to the ubuntu user
sudo -i -u ubuntu bash << 'EOF_USER'

# Installation d'Oh My Zsh avec Powerlevel10k sur Ubuntu
sh -c "$(curl -fsSL https://raw.githubusercontent.com/dyordsabuzo/miscellany/main/tools/omz-p10k-ubuntu-setup.sh)"
EOF_USER
