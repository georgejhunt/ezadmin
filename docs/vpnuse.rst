

===================
Using VPN (OpenVPN)
===================
For release 0.4, software keys are provided which will enable you to connect to an OpenVPN server at xsce.activitycentral.com. This will create a worldwide party line which can potentially connect the school servers within a deployment with administrators and support people in other parts of the world, and to one another.

This "virtual private network" is really a public network. Anyone who installs XSCE can connect to the central server, and attempt to connect to any of the computers that are similarly connected. However, conversations on this "public" vpn will be encrypted by ssh, and only directed to the two machines that have established an ssh connection.

CAUTION: Since the XSCE has enabled passwords for ssh conversations, and has created the "admin" user, and a standardized password, It is vitally important to change the password for user: "admin".  This can be done by becoming "root", and setting a new password by the terminal command "passwd admin".

A more secure approach would be to turn off password authentication completely, and use ssh_keygen to create your own set of public/private keys for use with your deployment and machines.

By default, the vpn software is loaded on the machine, but not activated.   To work as a communication path, the openvpn tunnel must be turned on. The vpn tunnel is controlled by the following commands:

 *xs-vpn test

 *xs-vpn on

 *xs-vpn status

 *xs-vpn off

"xs-vpn test" will start up the vpn tunnel. The intention was to have the "xs-vpn on" issue a warning it it discovers that password authentication is being used, and to suggest that public/private keys be used in stead. (It was discovered late in the QA cycle that this error message ins not issued). It will be corrected for the next release.

If it is desireable to have the vpn-tunnel always open, so that remote administration is continuously available, you can put the following line in /etc/crontab::
 1 * * * * root xs-vpn on #for hourly vpn startup -- or
 * 1 * * * root xs-vpn on #for daily startup

More details are available for  "Setting Up an XSCE VPN"_
