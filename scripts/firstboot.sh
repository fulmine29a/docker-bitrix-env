#!/usr/bin/env bash

export MEMORY_LIMIT=$1

chmod +x /root/firstboot.d/*.sh

for i in `find /root/firstboot.d/*.sh -type f`
do
    `$i`
done

rm rf /root/firstboot.d
rm /root/rm -f $0
