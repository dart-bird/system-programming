# system-programming
3-2 System programming (femu)

# Project 1

## FIO

### Common
- direct = 1
- bs = 16k
- size = 576M (576M for 4G, 288M for 2G, 144M for 1G SSD Setting)
- numjobs = 4
- timebased
- runtime = 300
- norandommap
### Cases
- rw = randread (Read 100%)
- rw = randrw (Read 50% / Write 50%)
- rw = randwrite (Write 100%)

## SYSBENCH

### Common
- time = 300
- file-total-size = 2304M (2304M for 4G, 1152M for 2G, 576M for 1G SSD Setting)
- file-test-mod = rndrw
- file-extra-flags = direct
- file-fsync-all = on
### Cases
- threads = 4 (4 Threads)
- threads = 32 (32 Threads)
