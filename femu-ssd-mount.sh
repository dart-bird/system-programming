#!/bin/bash
echo "============ FEMU MOUNT SCRIPT =============="
echo "============================================="
sudo mkdir /mnt/nvme0n1
sudo mkfs -t ext4 /dev/nvme0n1
sudo mount /dev/nvme0n1 /mnt/nvme0n1
sudo df -h -T | grep "dev/nvme0n1"
echo "============================================="
