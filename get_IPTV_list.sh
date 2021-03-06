#! /bin/sh

# Don't know the reason git just ignores $PATH, excutes `ssh in `/opt/bin`, 
# and cannot change by `git config --global core.sshCommand "/usr/bin/ssh /root/.ssh/id_rsa.pub -F /dev/null"`.
# Simply make a symble link. 
if [ ! -e /opt/bin/ssh ]; then
	ln -s /usr/bin/ssh /opt/bin/ssh
fi

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
if [ $?==0 ]; then 
	rm -rf /share/Web/refined.m3u
    if [ $?==0 ] ; then 
		cp /share/Web/IPTV/IPTV_Source_Shanghai_ChinaMobile_Accessible/refined.m3u /share/Web/refined.m3u ; 
		chmod 666 /share/Web/refined.m3u
	fi  
fi

# Get new version of scripts. 
if [ -e /share/Web/IPTV/IPTV_Source_Shanghai_ChinaMobile_Accessible/get_IPTV_list.sh ]; then 
	rm -rf /share/Web/IPTV/keep_IPTV_list.sh;
	rm -rf /share/Web/IPTV/get_IPTV_list.sh; 
    if [ $?==0 ] ; then 
		cp /share/Web/IPTV/IPTV_Source_Shanghai_ChinaMobile_Accessible/get_IPTV_list.sh /share/Web/IPTV/get_IPTV_list.sh ; 
		cp /share/Web/IPTV/IPTV_Source_Shanghai_ChinaMobile_Accessible/keep_IPTV_list.sh /share/Web/IPTV/keep_IPTV_list.sh;
		chmod 777 /share/Web/IPTV/get_IPTV_list.sh;
		chmod 777 /share/Web/IPTV/keep_IPTV_list.sh;
	fi  
fi

# Remove the repository
rm -rf /share/Web/IPTV/IPTV_Source_Shanghai_ChinaMobile_Accessible

