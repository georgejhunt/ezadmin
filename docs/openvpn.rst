==============================================
Virtual PUBLIC network -- Not the standard VPN
==============================================

In the more typical use of VPN, two offices are connected by a Virtual Private Network tunnel. The privacy is related to the secrecy of the software keys used in creating the tunnel.

The keys used by the XSCE VPN are not secret. They are downloaded, and are the same, for every schoolserver. So the XSCE VPN is not private.  It is PUBLIC. The XSCE VPN provides connectivity, not privacy! It's up to you to provide schoolserver with the ESSENTIAL level of Privacy.  Read on. . .

Turn off Passwords
==================

Machines connected the the XSCE virtual PUBLIC network should turn off passwords in the configuration of SSH. i.e. ... In /etc/ssh/sshd_config change the line to "PasswordAuthentication no". Follow the instructions at http://www.eng.cam.ac.uk/help/jpmg/ssh/authorized_keys_howto.html to generate software keys, and configure the client and server to use them.

 CAUTION -- IF YOU DO NOT DISABLE PASSWORDS for SSH: 
 Since the XSCE has enabled passwords for ssh conversations, and has created the "admin" user, and a standardized, and publicly known, password
 YOU MUST change the password for user: "admin". This can be done by becoming "root", and setting a new password by the terminal command "passwd admin".
 In addition, you MUST create a root password that includes capital letters, punctuation, and lower case letters.

What's Happening with the XSCE VPN
==================================

Activitycentral.com is providing, for testing purposes, a continuously available internet VPN server host. All XSCE schoolservers, when they start up a VPN tunnel, make a connection to that machine. Then it is possible for an administrator connect to this activitycentral.com host, and thereby communicate with his/her own machine.

How to Configure XSCE VPN
=========================

To start the openvpn tunnel automatically at every boot, you can add the following line to /etc/rc.d/rc.local: "/xs-vpn on" (this command will not succeed with PasswordAuthentication enabled). 

You can test XSCE VPN without disabling PasswordAuthentication by using the command "xs-vpn test".

To verify that the connection has been established, issue the terminal command "ifconfig", and look for the inet address of the "tun" device (wait for 30 seconds before you decide that openvpn is not working).   Note  the ip address that the openvpn server has assigned you. It will be 10.8.0.<some number>. The xsce.activitycentral.com server will have the address 10.8.0.1.  You can verify that you are connected with the command "ping 10.8.0.1".  If you get a ping response to this command, half of the connectivity is achieved.

The other half of the job is similar. If you are building more than one XSCE server, you can complete the install of XSCE on the second computer, and then verify that the two machines can ping one another.

If you want to connect to the XSCE via a personal desktop or laptop, you will need to obtain the correct openvpn application for your OS and hardware. Downloads are available at:https://openvpn.net/index.php?option=com_content&id=357

To make a second connection to xsce.activitycentral.com, you need to download openvpn client for the operating system your are using, and copy the ca.crt, client1.key, and client1.crt files from the schoolserver/etc/openvpn/keys folder to the correct location (follow downloaded instructions) .

In order to insure that the vpn tunnel remains open, after network or power outages, you can edit your /etc/crontab  file to include the last line in the following listing::

 SHELL=/bin/bash
 PATH=/sbin:/bin:/usr/sbin:/usr/bin
 MAILTO=root
 # For details see man 4 crontabs
 # Example of job definition:
 # .---------------- minute (0 - 59)
 # |  .------------- hour (0 - 23)
 # |  |  .---------- day of month (1 - 31)
 # |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
 # |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
 # |  |  |  |  |
 # *  *  *  *  * user-name  command to be executed
 1 * * * * root /usr/bin/xs-vpn on

This will cause the computer to check that the tunnel is open at 1 minute past the hour.

Suggestions for greater Security
================================
*Get your own computer to act as the central openvpn presence (rather than the "testing" host provided by activitycentral.com) and a fixed ip address from your Internet Service Provider (you might want to rent an instance from amazon EC2 rather than set up UPS, software backups, and Uninterruptible Power Supply, etc -- all the things required to have a reliable presence on the internet).
*Make a contract with computer experts (perhaps activitycentral.com) and pay money to have them set up a secure server for your private use (setting up secure servers requires knowledge and attention to detail).
*As you set up this private, secure, openvpn host, do not advertise its address
*Configure it to ignore pings.
*Do not run any popular services on that machine that may advertise its presence -- no web server, mail server, etc
*Create your own software keys which you share by hand carrying a USB stick to the computers you want to connect to the VPN tunnel. Turn off ssh passwords.
*Do not store any private data on this central computer. Assume that it will be compromised.

As in many things, what you gain in security, you may have to give up in usefulness and convenience.

what Privacy/Confidentiality can be "guaranteed" using the OpenVPN server?
==========================================================================

George Hunt's answer:

There are no guarantees. The benefits of remote access, for me, justify taking some risk. I can try to reduce this risk by doing the following:
* I pay amazon.com about $150 a year for an instance of openvpn-server which I administer, and to which all my schoolservers can connect.
* Passwords are turned off,
* The software keys used by each of my schoolservers have been generated by me.
* They are stored only on the computers that use them.
* and perhaps USB key is used to keep a backup copy of these keys
* and this USB key is physically locked up, and it is the only copy.
