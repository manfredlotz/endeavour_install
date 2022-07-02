#! /bin/sh

set -u

#OUT=installed.out
OUT=iso.out

mkdir -p $OUT
cd $OUT

inxi -Fxxxz > inxi_Fxxxz.$OUT
journalctl -b | grep -i nouveau > journalctl-b.nouveau.$OUT
journalctl -b | grep -i nvidia > journalctl-b.nvidia.$OUT
if test -f /tmp/nvidia-info.bash; then
  cp /tmp/nvidia-info.bash  nvidia-info.bash.$OUT
fi
sudo dmesg > dmesg.$OUT

# inxi -Faz | eos-sendlog
