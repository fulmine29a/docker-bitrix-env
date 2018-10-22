#!/usr/bin/env bash
export MEMORY_LIMIT

# setting memory limit, dirty... maybe not working in future...
sed -i "s/AVAILABLE_MEMORY=$.*/AVAILABLE_MEMORY=$MEMORY_LIMIT/g" /opt/webdir/bin/bitrix_utils.sh
sed -i "s/AVAILABLE_MEMORY=$.*/AVAILABLE_MEMORY=$MEMORY_LIMIT/g" /etc/ansible/library/bx_perf
/etc/ansible/library/bx_perf mysql
systemctl restart bvat
