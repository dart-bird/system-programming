#!/bin/bash
echo "====== ============== ======"
echo "====== FIO TEST START ======"
echo "====== ============== ======"
ssh femu "sudo rm -f /mnt/nvme0n1/*"
rm -f io_count_fio*
rm -f gc_count_fio*
rm -f io_count.log
rm -f gc_count.log
ssh femu "sudo rm -f /mnt/nvme0n1/fio_test_file.*"
ssh femu "sudo fio --directory=/mnt/nvme0n1 --name=fio_test_file --direct=1 --rw=randread --bs=16k --size=576M --numjobs=4 --time_based --runtime=300 --group_reporting --norandommap"
mv io_count.log io_count_fio_r.log
mv gc_count.log gc_count_fio_r.log
rm -f io_count.log
rm -f gc_count.log
ssh femu "sudo rm -f /mnt/nvme0n1/fio_test_file.*"
ssh femu "sudo fio --directory=/mnt/nvme0n1 --name=fio_test_file --direct=1 --rw=randrw --bs=16k --size=576M --numjobs=4 --time_based --runtime=300 --group_reporting --norandommap"
mv io_count.log io_count_fio_rw.log
mv gc_count.log gc_count_fio_rw.log
rm -f io_count.log
rm -f gc_count.log
ssh femu "sudo rm -f /mnt/nvme0n1/fio_test_file.*"
ssh femu "sudo fio --directory=/mnt/nvme0n1 --name=fio_test_file --direct=1 --rw=randwrite --bs=16k --size=576M --numjobs=4 --time_based --runtime=300 --group_reporting --norandommap"
mv io_count.log io_count_fio_w.log
mv gc_count.log gc_count_fio_w.log
rm -f io_count.log
rm -f gc_count.log
echo "====== ============ ========="
echo "====== FIO TEST END ========="
echo "====== ============ ========="

echo "                             "
echo "                             "

echo "====== =============== ======"
echo "====== SYS-BENCH START ======"
echo "====== =============== ======"
ssh femu "sudo rm -f /mnt/nvme0n1/*"
rm -f io_count_sysbench*
rm -f gc_count_sysbench*
rm -f io_count.log
rm -f gc_count.log
ssh femu "sudo rm -f /mnt/nvme0n1/test_file.*"
ssh femu "cd /mnt/nvme0n1 && sudo sysbench fileio --threads=32 --file-total-size=2304M --file-test-mode=rndrw prepare"
ssh femu "cd /mnt/nvme0n1 && sudo sysbench fileio --threads=32 --file-total-size=2304M --file-extra-flags=direct --file-fsync-all=on --file-test-mode=rndrw --time=300 run"
mv io_count.log io_count_sysbench_th32.log
mv gc_count.log gc_count_sysbench_th32.log
rm -f io_count.log
rm -f gc_count.log
ssh femu "sudo rm -f /mnt/nvme0n1/test_file.*"
ssh femu "cd /mnt/nvme0n1 && sudo sysbench fileio --threads=4 --file-total-size=2304M --file-test-mode=rndrw prepare"
ssh femu "cd /mnt/nvme0n1 && sudo sysbench fileio --threads=4 --file-total-size=2304M --file-extra-flags=direct --file-fsync-all=on --file-test-mode=rndrw --time=300 run"
mv io_count.log io_count_sysbench_th4.log
mv gc_count.log gc_count_sysbench_th4.log
rm -f io_count.log
rm -f gc_count.log
echo "====== ============= ========="
echo "====== SYS-BENCH END ========="
echo "====== ============= ========="
