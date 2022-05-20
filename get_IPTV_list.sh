#! /bin/sh

# Don't know the reason git look up ssh in /opt/bin, 
# and cannot change by git config --global core.sshCommand "/usr/bin/ssh /root/.ssh/id_rsa.pub -F /dev/null".
# Simply make a symble link. 
ln -s /usr/bin/ssh /opt/bin/ssh

# Check if the cloned repository exists. If yes, remove it. 
if [ -e /share/Web/IPTV/IPTV_Source_Shanghai_ChinaMobile_Accessible ]; then 
	rm -rf /share/Web/IPTV/IPTV_Source_Shanghai_ChinaMobile_Accessible
fi

# If successfully get into the IPTV folder, clone the repository. 
cd /share/Web/IPTV
if [ $?==0 ] ; then 
	git clone git@github.com:wdongw/IPTV_Source_Shanghai_ChinaMobile_Accessible.git
fi

# Remove the IPTV list and copy the new one.  
if [ -e /share/Web/IPTV/IPTV_Source_Shanghai_ChinaMobile_Accessible/refined.m3u ]; then 
	rm -rf /share/Web/IPTV/refined.m3u
    if [ $?==0 ] ; then 
		cp /share/Web/IPTV/IPTV_Source_Shanghai_ChinaMobile_Accessible/refined.m3u /share/Web/IPTV/refined.m3u ; 
	fi  
fi

# Remove the repository
rm -rf /share/Web/IPTV/IPTV_Source_Shanghai_ChinaMobile_Accessible

