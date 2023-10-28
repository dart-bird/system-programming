#!/bin/bash
rm /mnt/nvme0n1/test_file.*
cd /mnt/nvme0n1 && sudo sysbench fileio --threads=4 --file-total-size=2304M --file-test-mode=rndrw prepare
cd /mnt/nvme0n1 && sudo sysbench fileio --threads=4 --file-total-size=2304M --file-extra-flags=direct --file-fsync-all=on --file-test-mode=rndrw --time=300 run
