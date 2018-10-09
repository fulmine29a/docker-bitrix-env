#!/usr/bin/env bash

curl http://repos.1c-bitrix.ru/yum/bitrix-env.sh > /tmp/bitrix-env.sh
/bin/bash /tmp/bitrix-env.sh
rm -f /tmp/bitrix-env.sh
yum clean all
sed -i 's/MEMORY=$(free.*/MEMORY=$\{BVAT_MEM\:\=262144\}/g' /etc/init.d/bvat

rm -f $0