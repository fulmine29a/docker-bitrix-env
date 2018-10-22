FROM centos:latest

ENV SSH_PASS="bitrix" \
    TIMEZONE="Europe/Moscow" \
    container="docker"\
    MEMORY_LIMIT="1048000"

COPY scripts/ /root/

RUN adduser bitrix && \
    echo "bitrix:$SSH_PASS" | chpasswd && \
    echo "root:$SSH_PASS" | chpasswd && \
    yum install -y openssh-server && \
    cp -f /usr/share/zoneinfo/$TIMEZONE /etc/localtime && \
    chmod +x /root/firstboot.sh && \
    chmod +x /etc/rc.d/rc.local && \
    echo "if [ -f /root/firstboot.sh ]" >> /etc/rc.d/rc.local && \
    echo "then" >> /etc/rc.d/rc.local && \
    echo "     /root/firstboot.sh $MEMORY_LIMIT" >> /etc/rc.d/rc.local && \
    echo "fi" >> /etc/rc.d/rc.local

COPY overwrite-files-after-install /root/overwrite-files-after-install

CMD "/sbin/init"
