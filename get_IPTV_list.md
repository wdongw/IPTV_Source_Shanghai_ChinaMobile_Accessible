### Auto keep local refined.m3u uptodate. 
> ---

1. Put the script get_IPTV_list.sh anywhere you want. 
2. Allow it to run by chmod +x . 
3. Modify your crontab :
```
        vim /etc/config/crontab
```
Add a line like this at the bottom: 
```
        0 */4 */1 * * /bin/sh /share/Web/IPTV/get_IPTV_list.sh >/dev/null 2>&1
```
It means every one day every 4 hour run the script on minute 0.

4. Make the crontab take effect:
```
        crontab /etc/config/crontab && /etc/init.d/crond.sh restart
```
