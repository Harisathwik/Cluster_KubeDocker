# **Cluster Devices**

With Pi OS installed drive connected to PC (Windows)

For Reference https://youtu.be/X9fSMGkjtug

Open *cmdline.txt* file (Setting Static IP for devices)

Structure of the command

	cgroup_memory=1 cgroup_enable=memory ip=[ip-address-you-want-to-set]::[router-ip-address]:255.255.255.0:rpimaster:eth0:off

Append for ethernet

	cgroup_memory=1 cgroup_enable=memory ip=192.168.1.25::192.168.1.1:255.255.255.0:rpimaster:eth0:off

Append for wifi (not sure wlan0 for wifi)

	cgroup_memory=1 cgroup_enable=memory ip=192.168.1.25::192.168.1.1:255.255.255.0:rpimaster:wlan0:off for wifi 
	
Open *config.txt* .Add 

	arm_64bit=1
	
Just add new file *ssh* with powershell command in the same directory.
	
 	new-item ssh
	
SSH into All Devices then execute and reboot

	sudo iptables -F bin/iptables-legacy 
	sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
	sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
	sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
	
**REBOOT**
	
Execute for 1st Device

	curl -sfL https://get.k3s.io | sh - 
**Check for Ready node, takes ~30 seconds**
(To get devices list)

	sudo k3s kubectl get node 
 
SAVE THE MASTER NODE NAME
	
	cat /var/lib/rancher/k3s/server/node-token 
SAVE THE TOKEN FROM 1ST DEVICE
	
For Rest of the devices on the same network

	curl -sfL https://get.k3s.io | K3S_TOKEN="YOUR-SAVED-TOKEN" K3S_URL="https://[your server(static-ip)(192.168.1.25)]:6443" K3S_NODE_NAME="servername(NAME)" sh -
	curl -sfL https://get.k3s.io | K3S_TOKEN="RANDOM-STRING::server:RANDOM-STRING" K3S_URL="https://192.168.1.25:6443" K3S_NODE_NAME="raspberrypi" sh -
	
In 1st Device (To get devices list)

	sudo k3s kubectl get node 
