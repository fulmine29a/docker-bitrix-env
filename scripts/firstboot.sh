#!/usr/bin/env bash


curl http://repos.1c-bitrix.ru/yum/bitrix-env.sh > /tmp/bitrix-env.sh
/bin/bash /tmp/bitrix-env.sh
rm -f /tmp/bitrix-env.sh
yum clean all

# setting memory limit, dirty... maybe not working in future...
sed -i "s/AVAILABLE_MEMORY=$.*/AVAILABLE_MEMORY=$1/g" /opt/webdir/bin/bitrix_utils.sh
sed -i "s/AVAILABLE_MEMORY=$.*/AVAILABLE_MEMORY=$1/g" /etc/ansible/library/bx_perf
/etc/ansible/library/bx_perf mysql
systemctl restart bvat
# end memory limit

cp -rf --no-preserve=mode,ownership /root/overwrite-files-after-install/* /

rm -f $0
