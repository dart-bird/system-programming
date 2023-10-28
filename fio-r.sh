#!/bin/bash
fio --directory=/mnt/nvme0n1 --name=fio_test_file --direct=1 --rw=randread --bs=16k --size=576M --numjobs=4 --time_based --runtime=300 --group_reporting --norandommap
