- IPTV插件不要打开adaptive插件，否则可能会把mp2音频流识别为aac，造成频道没有声音
- 调整Kodi视频缓存，越大越好。参见：[Kodi Settings, advancedsettings.xml](https://kodi.wiki/view/Advancedsettings.xml)。否则视频可能卡顿。<br >但是内存使用太大可能造成系统崩溃，推荐使用1/3的物理内存。或者设置为0，使用磁盘作为缓存。
```
me@mymbp userdata % cat advancedsettings.xml 
<advancedsettings version="1.0">
<cache>
  <memorysize>80000000</memorysize>   <!-- Number of bytes used for buffering streams in memory when set to 0 the cache will be written to disk instead of RAM -->
  <buffermode>1</buffermode>   <!-- Choose what to buffer:
                                    0) Buffer all internet filesystems (like "2" but additionally also ftp, webdav, etc.) 
                                    1) Buffer all filesystems (including local) (default since Kodi 19)
                                    2) Only buffer true internet filesystems (streams) (http, https, etc.)
                                    3) No buffer
                                    4) Buffer all network filesystems (incl. smb, nfs, etc.) -->
  <readfactor>10.0</readfactor> <!-- This factor determines the max readrate in terms of readfactor * avg bitrate of a video file. 
                                    This can help on bad connections to keep the cache filled. It will also greatly speed up buffering. Default value 4.0. -->
</cache>
</advancedsettings>
```

- 国家地理和探索频道兰州大学源，必须修改/etc/hosts文件以访问。Kodi解析IPv6地址有问题。 
添加一行到/etc/hosts里面:
`2001:da8:c000:1201:f816:3eff:fe09:940e lanzhou.edu.cn`

- TMDB连接失败，因为DNS解析错误。在本地hosts文件增加如下一行解决：
```
13.225.198.42 api.themoviedb.org
```

TMDB API各地地址：
|  |  |  |  |
|---|---|---|---|
|新加坡:<br>18.161.97.16<br>18.161.97.58<br>18.161.97.89<br>18.161.97.25|美国东部:<br>108.138.246.125<br>108.138.246.55<br>108.138.246.6<br>108.138.246.57|加拿大:<br>52.85.130.35<br>52.85.130.84<br>52.85.130.97<br>52.85.130.57|美国西部:<br>13.227.74.71<br>13.227.74.86<br>13.227.74.20<br>13.227.74.96|
|欧洲:<br>108.138.17.101<br>108.138.17.92<br>108.138.17.34<br>108.138.17.18|澳大利亚:<br>18.65.229.37<br>18.65.229.32<br>18.65.229.44<br>18.65.229.12|未知:<br>13.225.198.42| |
