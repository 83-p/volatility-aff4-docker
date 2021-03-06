# Volatility Docker image

This Docker image is intended to run the AFF4 plugin.

## build

```
$ docker build -t volatility .
 .
 .
 .
$
```

## run
```
$ docker run -v $(pwd):/aff4 -i -t volatility bash -l
root@000000000000:/work/volatility# 
```

### imageinfo of aff4
```
root@000000000000:/work/volatility# python vol.py -f /aff4/XXXXXX.aff4 imageinfo
Volatility Foundation Volatility Framework 2.6.1
INFO    : root                : Generating grammar tables from /usr/lib/python2.7/lib2to3/Grammar.txt
INFO    : root                : Generating grammar tables from /usr/lib/python2.7/lib2to3/PatternGrammar.txt
INFO    : volatility.debug    : Determining profile based on KDBG search...
          Suggested Profile(s) : Win7SP1x86_23418, Win7SP0x86, Win7SP1x86_24000, Win7SP1x86 (Instantiated with WinXPSP2x86)
                     AS Layer1 : IA32PagedMemory (Kernel AS)
                     AS Layer2 : AFF4AddressSpace (/aff4/XXXXXX.aff4)
                     AS Layer3 : FileAddressSpace (/aff4/XXXXXX.aff4)
                      PAE type : No PAE
                           DTB : 0x000000L
             KUSER_SHARED_DATA : 0x00000000L
           Image date and time : 2021-01-01 00:00:00 UTC+0000
     Image local date and time : 2021-01-01 00:00:00 +0000
root@000000000000:/work/volatility# 
```

### pstree
```
root@000000000000:/work/volatility# python vol.py -f /aff4/XXXXXX.aff4 --profile=Win7SP0x86 pstree
Volatility Foundation Volatility Framework 2.6.1
INFO    : root                : Generating grammar tables from /usr/lib/python2.7/lib2to3/Grammar.txt
INFO    : root                : Generating grammar tables from /usr/lib/python2.7/lib2to3/PatternGrammar.txt
Name                                                  Pid   PPid   Thds   Hnds Time
-------------------------------------------------- ------ ------ ------ ------ ----
 0x00000000:wininit.exe                               384    340      3     77 2021-01-01 00:00:00 UTC+0000
 .
 .
 .
 ```
 
 ### exporting raw memory image from aff4
 ```
root@000000000000:/work/volatility# python vol.py -f /aff4//XXXXXXC.aff4 --profile=Win7SP1x64 imagecopy -O /aff4//XXXXXXC.raw
Volatility Foundation Volatility Framework 2.6.1
INFO    : root                : Generating grammar tables from /usr/lib/python2.7/lib2to3/Grammar.txt
INFO    : root                : Generating grammar tables from /usr/lib/python2.7/lib2to3/PatternGrammar.txt
Writing data (5.00 MB chunks): |.................................................................................................................................|
root@000000000000:/work/volatility# 
```
