#!/bin/bash
sudo apt update
sudo apt install -y python3-pip
sudo apt install -y fio
sudo apt install -y sysbench
echo [Check fio,sysbench installed]
sysbench --version
fio -v
