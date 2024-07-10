#!/bin/bash

echo "===================="
echo "System Information"
echo "===================="
uname -a
hostnamectl
echo

echo "===================="
echo "Kernel Information"
echo "===================="
uname -r
cat /proc/version
echo

echo "===================="
echo "Operating System"
echo "===================="
cat /etc/os-release
lsb_release -a
echo

echo "===================="
echo "User Information"
echo "===================="
id
whoami
lastlog | grep -v 'Never'
echo

echo "===================="
echo "Environment Variables"
echo "===================="
env
echo

echo "===================="
echo "Sudoers Information"
echo "===================="
cat /etc/sudoers
sudo -l
echo

echo "===================="
echo "User and Group Information"
echo "===================="
cat /etc/passwd
cat /etc/group
echo

echo "===================="
echo "Shadow File"
echo "===================="
cat /etc/shadow
echo

echo "===================="
echo "Installed Packages"
echo "===================="
dpkg -l
rpm -qa
echo

echo "===================="
echo "Running Processes"
echo "===================="
ps aux
ps -ef
pstree
top -b -n 1
echo

echo "===================="
echo "Running Services"
echo "===================="
service --status-all
systemctl list-units --type=service --state=running
echo

echo "===================="
echo "Scheduled Jobs"
echo "===================="
crontab -l
cat /etc/crontab
ls -la /etc/cron.*
cat /etc/anacrontab
echo

echo "===================="
echo "Network Configuration"
echo "===================="
ifconfig -a
ip a
ip route
echo

echo "===================="
echo "Listening Ports"
echo "===================="
netstat -tulpn
ss -tulpn
echo

echo "===================="
echo "Active Connections"
echo "===================="
netstat -antp
ss -antp
echo

echo "===================="
echo "Firewall Rules"
echo "===================="
iptables -L
ufw status verbose
echo

echo "===================="
echo "DNS Information"
echo "===================="
cat /etc/resolv.conf
echo

echo "===================="
echo "ARP Cache"
echo "===================="
arp -a
echo

echo "===================="
echo "Routing Table"
echo "===================="
route -n
echo

echo "===================="
echo "Files with SUID/SGID"
echo "===================="
find / -perm /6000 -type f 2>/dev/null
echo

echo "===================="
echo "World Writable Files"
echo "===================="
find / -type f -perm -o+w 2>/dev/null
echo

echo "===================="
echo "World Writable Directories"
echo "===================="
find / -type d -perm -o+w 2>/dev/null
echo

echo "===================="
echo "Sticky Bit Directories"
echo "===================="
find / -type d -perm -1000 2>/dev/null
echo

echo "===================="
echo "NFS Exports"
echo "===================="
cat /etc/exports
showmount -e
echo

echo "===================="
echo "Mount Points"
echo "===================="
mount
df -h
echo

echo "===================="
echo "Disk Usage"
echo "===================="
df -hT
du -sh /*
echo

echo "===================="
echo "Potential Credential Files"
echo "===================="
grep -r 'password' /etc/ 2>/dev/null
grep -r 'password' /home/ 2>/dev/null
grep -r 'password' /root/ 2>/dev/null
echo

echo "===================="
echo "Potential SSH Keys"
echo "===================="
find / -name "id_rsa*" 2>/dev/null
echo

echo "===================="
echo "Potential Config Files"
echo "===================="
find / -name "*.conf" 2>/dev/null
echo

echo "===================="
echo "Systemd Timers"
echo "===================="
systemctl list-timers --all
echo

echo "===================="
echo "Docker Information"
echo "===================="
docker ps -a
docker images
docker info
echo

echo "===================="
echo "LXD/LXC Containers"
echo "===================="
lxc list
lxd --version
echo

echo "===================="
echo "Virtualization Information"
echo "===================="
systemd-detect-virt
virt-what
echo

echo "===================="
echo "Potential Exploitable Binaries"
echo "===================="
find / -perm -4000 -type f 2>/dev/null | xargs ls -la
echo

echo "===================="
echo "Checking for Passwords in .bash_history"
echo "===================="
cat ~/.bash_history | grep -i password
echo

echo "===================="
echo "Checking for Passwords in .ssh"
echo "===================="
grep -r 'password' ~/.ssh/
echo

echo "===================="
echo "Checking for Passwords in /var/log"
echo "===================="
grep -r 'password' /var/log 2>/dev/null
echo

echo "===================="
echo "Potential Sensitive Files"
echo "===================="
find / -name "wp-config.php" 2>/dev/null
find / -name ".htpasswd" 2>/dev/null
echo

echo "===================="
echo "Checking for PATH Manipulation"
echo "===================="
echo $PATH | tr ":" "\n" | xargs -I{} ls -la {} 2>/dev/null | grep -v "total"
echo

echo "===================="
echo "Checking for Writable Scripts in PATH"
echo "===================="
echo $PATH | tr ":" "\n" | xargs -I{} find {} -type f -perm -o+w 2>/dev/null
echo

echo "===================="
echo "Checking for Kernel Exploits"
echo "===================="
uname -r > kernel_version.txt
searchsploit -w $(cat kernel_version.txt)
rm kernel_version.txt
echo

echo "===================="
echo "Enumerating Filesystems"
echo "===================="
lsblk
blkid
echo

echo "===================="
echo "Checking for Backup Files"
echo "===================="
find / -name "*.bak" -o -name "*.old" -o -name "*.backup" 2>/dev/null
echo

echo "===================="
echo "Checking for Core Dumps"
echo "===================="
find / -name "core" 2>/dev/null
echo

echo "===================="
echo "Enumerating Installed Compilers"
echo "===================="
dpkg --list | grep compiler
rpm -qa | grep compiler
echo

echo "===================="
echo "Checking for Development Tools"
echo "===================="
which gcc
which make
which perl
which python
which ruby
which go
which rustc
echo

echo "===================="
echo "Enumerating Mail"
echo "===================="
ls -la /var/mail
ls -la /var/spool/mail
cat /var/mail/* 2>/dev/null
echo

echo "===================="
echo "Checking for OpenSSL Versions"
echo "===================="
openssl version -a
echo

echo "===================="
echo "Checking for Bash Version"
echo "===================="
bash --version
echo

echo "===================="
echo "Checking for Python Version"
echo "===================="
python --version
python3 --version
echo

echo "===================="
echo "Checking for Java Version"
echo "===================="
java -version
echo

echo "===================="
echo "Enumerating USB Devices"
echo "===================="
lsusb
echo

echo "===================="
echo "Enumerating PCI Devices"
echo "===================="
lspci
echo

echo "===================="
echo "Checking for Mounted Network Filesystems"
echo "===================="
mount | grep nfs
mount | grep cifs
echo

echo "===================="
echo "Checking for World Writable Directories in PATH"
echo "===================="
echo $PATH | tr ":" "\n" | xargs -I{} find {} -type d -perm -o+w 2>/dev/null
echo

echo "===================="
echo "Checking for World Writable Files in PATH"
echo "===================="
echo $PATH | tr ":" "\n" | xargs -I{} find {} -type f -perm -o+w 2>/dev/null
echo

echo "===================="
echo "Checking for Writable Files in /etc"
echo "===================="
find /etc -writable -type f 2>/dev/null
echo

echo "===================="
echo "Checking for Writable Files in /var"
echo "===================="
find /var -writable -type f 2>/dev/null
echo

echo "===================="
echo "Checking for Writable Files in /usr"
echo "===================="
find /usr -writable -type f 2>/dev/null
echo

echo "===================="
echo "Checking for Writable Files in /tmp"
echo "===================="
find /tmp -writable -type f 2>/dev/null
echo

echo "===================="
echo "Checking for Writable Files in /root"
echo "===================="
find /root -writable -type f 2>/dev/null
echo

echo "===================="
echo "Checking for Capabilities"
echo "===================="
getcap -r / 2>/dev/null
echo

echo "===================="
echo "Checking for Uncommon SUID/SGID Files"
echo "===================="
find / -perm /4000 -o -perm /2000 ! -path "/proc/*" ! -path "/dev/*" 2>/dev/null
echo

echo "===================="
echo "Checking for Misconfigured Services"
echo "===================="
systemctl list-unit-files | grep enabled
echo

echo "===================="
echo "Checking for Docker Privileges"
echo "===================="
docker ps -a --no-trunc --format '{{.ID}} {{.Name}} {{.Image}} {{.Command}}'
echo

echo "===================="
echo "Checking for Docker Containers Running as Root"
echo "===================="
docker ps -a --filter "status=running" --filter "label=com.docker.compose.service" --format '{{.ID}} {{.Names}} {{.Image}} {{.Command}}' | xargs -I{} sh -c 'docker inspect --format "{{.State.Pid}}" {}'
echo

echo "===================="
echo "Checking for Kernel Modules"
echo "===================="
lsmod
echo

echo "===================="
echo "Checking for Loaded Kernel Modules"
echo "===================="
cat /proc/modules
echo

echo "===================="
echo "Checking for OpenVPN Configurations"
echo "===================="
find / -name "*.ovpn" -o -name "*.conf" | grep -i vpn 2>/dev/null
echo

echo "===================="
echo "Checking for FTP Configurations"
echo "===================="
find / -name "vsftpd.conf" -o -name "proftpd.conf" 2>/dev/null
echo

echo "===================="
echo "Checking for Apache Configurations"
echo "===================="
find / -name "httpd.conf" -o -name "apache2.conf" 2>/dev/null
echo

echo "===================="
echo "Checking for Nginx Configurations"
echo "===================="
find / -name "nginx.conf" 2>/dev/null
echo

echo "===================="
echo "Checking for MySQL Configurations"
echo "===================="
find / -name "my.cnf" -o -name "my.ini" 2>/dev/null
echo

echo "===================="
echo "Checking for PostgreSQL Configurations"
echo "===================="
find / -name "postgresql.conf" 2>/dev/null
echo

echo "===================="
echo "Checking for PHP Configurations"
echo "===================="
find / -name "php.ini" 2>/dev/null
echo

echo "===================="
echo "Checking for WordPress Configurations"
echo "===================="
find / -name "wp-config.php" 2>/dev/null
echo

echo "===================="
echo "Checking for Logs"
echo "===================="
ls -la /var/log/
cat /var/log/syslog
cat /var/log/auth.log
cat /var/log/dmesg
echo

echo "===================="
echo "Checking for Containers"
echo "===================="
docker ps -a
lxc list
echo

echo "===================="
echo "Checking for Web Application Files"
echo "===================="
find /var/www -type f 2>/dev/null
echo

echo "===================="
echo "Checking for Development Files"
echo "===================="
find / -name "*.py" -o -name "*.rb" -o -name "*.pl" -o -name "*.sh" 2>/dev/null
echo

echo "===================="
echo "Checking for Large Files"
echo "===================="
find / -type f -size +100M 2>/dev/null
echo

echo "===================="
echo "Checking for Database Files"
echo "===================="
find / -name "*.sql" -o -name "*.db" -o -name "*.sqlite" 2>/dev/null
echo

echo "===================="
echo "Checking for Backup and Configuration Files"
echo "===================="
find / -name "*.bak" -o -name "*.old" -o -name "*.backup" 2>/dev/null
echo

echo "===================="
echo "Checking for Sensitive Files in Home Directories"
echo "===================="
for user in $(cut -d: -f1 /etc/passwd); do
    find /home/$user -name "*.pem" -o -name "*.key" -o -name "*.crt" 2>/dev/null
done
echo

echo "===================="
echo "Checking for Sensitive Files in Root Directory"
echo "===================="
find /root -name "*.pem" -o -name "*.key" -o -name "*.crt" 2>/dev/null
echo

echo "===================="
echo "Checking for Sensitive Files in /etc"
echo "===================="
find /etc -name "*.pem" -o -name "*.key" -o -name "*.crt" 2>/dev/null
echo

echo "===================="
echo "Checking for Sensitive Files in /var"
echo "===================="
find /var -name "*.pem" -o -name "*.key" -o -name "*.crt" 2>/dev/null
echo

echo "===================="
echo "Checking for Sensitive Files in /usr"
echo "===================="
find /usr -name "*.pem" -o -name "*.key" -o -name "*.crt" 2>/dev/null
echo

echo "===================="
echo "Checking for Sensitive Files in /tmp"
echo "===================="
find /tmp -name "*.pem" -o -name "*.key" -o -name "*.crt" 2>/dev/null
echo

echo "===================="
echo "Checking for Hidden Files in Home Directories"
echo "===================="
for user in $(cut -d: -f1 /etc/passwd); do
    find /home/$user -name ".*" 2>/dev/null
done
echo

echo "===================="
echo "Checking for Hidden Files in Root Directory"
echo "===================="
find /root -name ".*" 2>/dev/null
echo

echo "===================="
echo "Checking for Hidden Files in /etc"
echo "===================="
find /etc -name ".*" 2>/dev/null
echo

echo "===================="
echo "Checking for Hidden Files in /var"
echo "===================="
find /var -name ".*" 2>/dev/null
echo

echo "===================="
echo "Checking for Hidden Files in /usr"
echo "===================="
find /usr -name ".*" 2>/dev/null
echo

echo "===================="
echo "Checking for Hidden Files in /tmp"
echo "===================="
find /tmp -name ".*" 2>/dev/null
echo

echo "===================="
echo "Checking for Temporary Files"
echo "===================="
find /tmp -type f 2>/dev/null
find /var/tmp -type f 2>/dev/null
echo

echo "===================="
echo "Checking for Configuration Files in Home Directories"
echo "===================="
for user in $(cut -d: -f1 /etc/passwd); do
    find /home/$user -name "*.conf" 2>/dev/null
done
echo

echo "===================="
echo "Checking for Configuration Files in Root Directory"
echo "===================="
find /root -name "*.conf" 2>/dev/null
echo

echo "===================="
echo "Checking for Configuration Files in /etc"
echo "===================="
find /etc -name "*.conf" 2>/dev/null
echo

echo "===================="
echo "Checking for Configuration Files in /var"
echo "===================="
find /var -name "*.conf" 2>/dev/null
echo

echo "===================="
echo "Checking for Configuration Files in /usr"
echo "===================="
find /usr -name "*.conf" 2>/dev/null
echo

echo "===================="
echo "Checking for Configuration Files in /tmp"
echo "===================="
find /tmp -name "*.conf" 2>/dev/null
echo

echo "===================="
echo "Checking for Backup Files in Home Directories"
echo "===================="
for user in $(cut -d: -f1 /etc/passwd); do
    find /home/$user -name "*.bak" -o -name "*.old" -o -name "*.backup" 2>/dev/null
done
echo

echo "===================="
echo "Checking for Backup Files in Root Directory"
echo "===================="
find /root -name "*.bak" -o -name "*.old" -o -name "*.backup" 2>/dev/null
echo

echo "===================="
echo "Checking for Backup Files in /etc"
echo "===================="
find /etc -name "*.bak" -o -name "*.old" -o -name "*.backup" 2>/dev/null
echo

echo "===================="
echo "Checking for Backup Files in /var"
echo "===================="
find /var -name "*.bak" -o -name "*.old" -o -name "*.backup" 2>/dev/null
echo

echo "===================="
echo "Checking for Backup Files in /usr"
echo "===================="
find /usr -name "*.bak" -o -name "*.old" -o -name "*.backup" 2>/dev/null
echo

echo "===================="
echo "Checking for Backup Files in /tmp"
echo "===================="
find /tmp -name "*.bak" -o -name "*.old" -o -name "*.backup" 2>/dev/null
echo

echo "===================="
echo "Checking for Core Dumps in Home Directories"
echo "===================="
for user in $(cut -d: -f1 /etc/passwd); do
    find /home/$user -name "core" 2>/dev/null
done
echo

echo "===================="
echo "Checking for Core Dumps in Root Directory"
echo "===================="
find /root -name "core" 2>/dev/null
echo

echo "===================="
echo "Checking for Core Dumps in /etc"
echo "===================="
find /etc -name "core" 2>/dev/null
echo

echo "===================="
echo "Checking for Core Dumps in /var"
echo "===================="
find /var -name "core" 2>/dev/null
echo

echo "===================="
echo "Checking for Core Dumps in /usr"
echo "===================="
find /usr -name "core" 2>/dev/null
echo

echo "===================="
echo "Checking for Core Dumps in /tmp"
echo "===================="
find /tmp -name "core" 2>/dev/null
echo

echo "===================="
echo "Checking for Unmounted Partitions"
echo "===================="
cat /etc/fstab
echo

echo "===================="
echo "Checking for Misconfigured Services"
echo "===================="
systemctl list-unit-files | grep enabled
echo

echo "===================="
echo "Checking for Running Containers"
echo "===================="
docker ps -a
lxc list
echo

echo "===================="
echo "Checking for World Writable Files in /var"
echo "===================="
find /var -type f -perm -o+w 2>/dev/null
echo

echo "===================="
echo "Checking for World Writable Files in /usr"
echo "===================="
find /usr -type f -perm -o+w 2>/dev/null
echo

echo "===================="
echo "Checking for World Writable Files in /root"
echo "===================="
find /root -type f -perm -o+w 2>/dev/null
echo

echo "===================="
echo "Checking for World Writable Files in /tmp"
echo "===================="
find /tmp -type f -perm -o+w 2>/dev/null
echo

echo "===================="
echo "Checking for Configuration Files in /var"
echo "===================="
find /var -name "*.conf" 2>/dev/null
echo

echo "===================="
echo "Checking for Configuration Files in /usr"
echo "===================="
find /usr -name "*.conf" 2>/dev/null
echo

echo "===================="
echo "Checking for Configuration Files in /root"
echo "===================="
find /root -name "*.conf" 2>/dev/null
echo

echo "===================="
echo "Checking for Configuration Files in /tmp"
echo "===================="
find /tmp -name "*.conf" 2>/dev/null
echo

echo "===================="
echo "Checking for Development Files in /var"
echo "===================="
find /var -name "*.py" -o -name "*.rb" -o -name "*.pl" -o -name "*.sh" 2>/dev/null
echo

echo "===================="
echo "Checking for Development Files in /usr"
echo "===================="
find /usr -name "*.py" -o -name "*.rb" -o -name "*.pl" -o -name "*.sh" 2>/dev/null
echo

echo "===================="
echo "Checking for Development Files in /root"
echo "===================="
find /root -name "*.py" -o -name "*.rb" -o -name "*.pl" -o -name "*.sh" 2>/dev/null
echo

echo "===================="
echo "Checking for Development Files in /tmp"
echo "===================="
find /tmp -name "*.py" -o -name "*.rb" -o -name "*.pl" -o -name "*.sh" 2>/dev/null
echo

echo "===================="
echo "Checking for Large Files in /var"
echo "===================="
find /var -type f -size +100M 2>/dev/null
echo

echo "===================="
echo "Checking for Large Files in /usr"
echo "===================="
find /usr -type f -size +100M 2>/dev/null
echo

echo "===================="
echo "Checking for Large Files in /root"
echo "===================="
find /root -type f -size +100M 2>/dev/null
echo

echo "===================="
echo "Checking for Large Files in /tmp"
echo "===================="
find /tmp -type f -size +100M 2>/dev/null
echo

echo "===================="
echo "Checking for Backup Files in /var"
echo "===================="
find /var -name "*.bak" -o -name "*.old" -o -name "*.backup" 2>/dev/null
echo

echo "===================="
echo "Checking for Backup Files in /usr"
echo "===================="
find /usr -name "*.bak" -o -name "*.old" -o -name "*.backup" 2>/dev/null
echo

echo "===================="
echo "Checking for Backup Files in /root"
echo "===================="
find /root -name "*.bak" -o -name "*.old" -o -name "*.backup" 2>/dev/null
echo

echo "===================="
echo "Checking for Backup Files in /tmp"
echo "===================="
find /tmp -name "*.bak" -o -name "*.old" -o -name "*.backup" 2>/dev/null
echo

echo "===================="
echo "Checking for Sensitive Files in /var"
echo "===================="
find /var -name "*.pem" -o -name "*.key" -o -name "*.crt" 2>/dev/null
echo

echo "===================="
echo "Checking for Sensitive Files in /usr"
echo "===================="
find /usr -name "*.pem" -o -name "*.key" -o -name "*.crt" 2>/dev/null
echo

echo "===================="
echo "Checking for Sensitive Files in /root"
echo "===================="
find /root -name "*.pem" -o -name "*.key" -o -name "*.crt" 2>/dev/null
echo

echo "===================="
echo "Checking for Sensitive Files in /tmp"
echo "===================="
find /tmp -name "*.pem" -o -name "*.key" -o -name "*.crt" 2>/dev/null
echo

echo "===================="
echo "Checking for Hidden Files in /var"
echo "===================="
find /var -name ".*" 2>/dev/null
echo

echo "===================="
echo "Checking for Hidden Files in /usr"
echo "===================="
find /usr -name ".*" 2>/dev/null
echo

echo "===================="
echo "Checking for Hidden Files in /root"
echo "===================="
find /root -name ".*" 2>/dev/null
echo

echo "===================="
echo "Checking for Hidden Files in /tmp"
echo "===================="
find /tmp -name ".*" 2>/dev/null
echo

echo "===================="
echo "Enumeration Complete!"
echo "===================="
