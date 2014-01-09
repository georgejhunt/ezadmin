
==================================
Tiny Core Linux Customization tool
==================================
By copying the contents of the folder /usr/share/xs-config/tcccustomize to a USB stick, a small deployment can add or remove activities from a stock OS image (see [http://dev.laptop.org/~quozl/mktinycorexo/HOWTO.xo-custom http://dev.laptop.org/~quozl/mktinycorexo/HOWTO.xo-custom]

To do this copy, insert a USB stick into the schoolserver, and at a terminal prompt, issue the command::
 ls /mnt/usb*

The USB stick is automatically mounted and will be listed. Note the path of the stick,  and copy the customization program to the stick::
 cp -rp /usr/share/xs-config/tccustomize/* <path of the target stick>

Note that this will require that the XO terminals be unsecured. You can determine if a laptop is secured by turning it on, and then immediately pressing the "esc" key in the upper left of the keyboard. If you get an "OK" prompt, the laptop is already security disabled. If no "OK", then obtain a Developer key, and issue "disable-security" at the OK bios prompt  --http://wiki.laptop.org/go/Activation_and_developer_keys#Disabling_the_security_system).
