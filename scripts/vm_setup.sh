#!/bin/bash 
sudo apt install apache2
sudo ufw app list
sudo ufw allow 'Apache'
sudo ufw status
sudo systemctl status apache2
sudo echo 'PCFET0NUWVBFIGh0bWw+CjxodG1sPgo8aGVhZD4KPHRpdGxlPlBhZ2UgVGl0bGU8L3RpdGxlPgo8L2hlYWQ+Cjxib2R5Pgo8aWZyYW1lIHdpZHRoPSI1NjAiIGhlaWdodD0iMzE1IiBzcmM9Imh0dHBzOi8vd3d3LnlvdXR1YmUuY29tL2VtYmVkL2FLWDVJTW95LTc4IiB0aXRsZT0iWW91VHViZSB2aWRlbyBwbGF5ZXIiIGZyYW1lYm9yZGVyPSIwIiBhbGxvdz0iYWNjZWxlcm9tZXRlcjsgYXV0b3BsYXk7IGNsaXBib2FyZC13cml0ZTsgZW5jcnlwdGVkLW1lZGlhOyBneXJvc2NvcGU7IHBpY3R1cmUtaW4tcGljdHVyZSIgYWxsb3dmdWxsc2NyZWVuPjwvaWZyYW1lPgo8L2JvZHk+CjwvaHRtbD4K' | base64 --decode > /var/www/html/index.html
sudo chown apache:apache /var/www/html/index.html


# ok, I'll add a user and stuff
sudo su -c "useradd jstewart -s /bin/bash -m "
sudo chpasswd << 'END'
jsetwart:newpassword
END

