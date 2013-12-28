# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
expiry=`chage -l setup|gawk -F: '/Password expires/ {print $2}'`
echo "*********************************************************************"
echo "*Change passwod before $expiry.  Or you risk becoming         *"
echo "*   locked out and may be required to re-load the OS to recover.    *"
echo "*After changing, use 'xs-password-forever' to disable this message  *"
echo "*********************************************************************"
