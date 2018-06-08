# iostat
> 监控系统设备I/O负载情况，也可以对cpu的使用情况进行统计。显示距上次执行iostat或开机时间内的统计信息
```shell
%user:用户进程占用cpu时间片的百分比
%system:内核进程占用cpu时间片的百分比
%nice:修改了优先级的进程所占用cpu时间片的百分比
%iowait:表示cpu等待磁盘io完成所占用cpu时间片的百分比
%steal:虚拟cpu所占时间百分比
%idle:cpu空闲时间百分比

[weblogic@backupserver2 apps]$ iostat
Linux 2.6.32-431.el6.x86_64 (backupserver2)     2018年06月08日  _x86_64_        (8 CPU)

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           6.19    2.96    0.19    0.12    0.00   90.54
           
                          (每秒读)                  (总共读)
Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
sda               2.09        21.91       269.44  510075294 6274203549
dm-0              1.69         0.58        13.34   13579594  310736296
dm-1              0.02         0.03         0.10     701176    2343232
dm-2             32.22        21.29       256.00  495769410 5961123949

```

# top
> h显示帮助  
> z换颜色 b粗体 x显示排序列 y选中运行中的进程 P按cpu排序 M按内存排序 T按运行时间排序  
> 顶上状态显示控制：l t m
```shell
top - 09:50:59 up 269 days, 12:24, 11 users,  load average: 0.24, 0.25, 0.20
Tasks: 318 total,   1 running, 317 sleeping,   0 stopped,   0 zombie
Cpu(s):  0.1%us,  0.1%sy,  1.3%ni, 98.5%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Mem:  37020572k total, 22482208k used, 14538364k free,   700308k buffers
Swap:  8241144k total,   117404k used,  8123740k free, 16269716k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND                                                                
22439 weblogic  20   0 22.5g 3.4g 5444 S  8.6  9.7  75:13.49 java                                                                   
14284 weblogic  20   0  691m 553m 2324 S  1.3  1.5   0:23.64 vim                                                                    
   39 root      20   0     0    0    0 S  1.0  0.0 129:16.27 events/4                                                               
22533 weblogic  20   0 5716m  85m 4212 S  1.0  0.2  26:19.23 java                                                                   
   36 root      20   0     0    0    0 S  0.3  0.0 192:28.11 events/1                                                               
14563 weblogic  20   0 15168 1424  948 R  0.3  0.0   0:00.19 top                                                                    
    1 root      20   0 19364 1136  904 S  0.0  0.0   8:13.68 init                                                                   
    2 root      20   0     0    0    0 S  0.0  0.0   0:04.54 kthreadd                                                               
    3 root      RT   0     0    0    0 S  0.0  0.0   0:47.32 migration/0                                                            
    4 root      20   0     0    0    0 S  0.0  0.0   1:24.80 ksoftirqd/0                                                            
    5 root      RT   0     0    0    0 S  0.0  0.0   0:00.00 migration/0                                                            
    6 root      RT   0     0    0    0 S  0.0  0.0   0:31.24 watchdog/0                                                             
    7 root      RT   0     0    0    0 S  0.0  0.0   1:02.57 migration/1             
```
