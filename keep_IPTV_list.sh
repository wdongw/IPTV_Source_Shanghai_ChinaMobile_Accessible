#!/bin/sh

if [ -s /share/Web/refined.m3u ]; then
        echo exist ;
else
        ps aux | grep git | grep -v grep >/dev/null 2>&1;
        if [ $? ]; then  
                sleep 5;
                ./get_IPTV_list.sh;
        fi
fi