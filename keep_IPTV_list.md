### Monitor local refined.m3u. 
> ---

It's found that the refined.m3u will get lost after reboot. Don't know the root cause. 
Just use this way to keep it refetched from source. 

1. Put the script keep_IPTV_list.sh anywhere you want. 
2. Allow it to run by chmod +x . 
3. Modify your crontab :
```
        vim /etc/config/crontab
```
Add a line like this at the bottom: 
```
        */1 * * * * /bin/sh /share/Web/IPTV/keep_IPTV_list.sh >/dev/null 2>&1
```
It means every one day every 1 minute run the script.

4. Make the crontab take effect:
```
        crontab /etc/config/crontab && /etc/init.d/crond.sh restart
```
