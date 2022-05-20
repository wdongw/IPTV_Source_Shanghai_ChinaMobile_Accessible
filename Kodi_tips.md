- IPTV插件不要打开adaptive插件，否则可能会把mp2音频流识别为aac，造成频道没有声音
- 调整Kodi视频缓存，越大越好。参见：[Kodi Settings, advancedsettings.xml](https://kodi.wiki/view/Advancedsettings.xml)。否则视频可能卡顿。<br >
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
