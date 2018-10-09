FROM centos:latest

ENV SSH_PASS="bitrix"
ENV TIMEZONE="Europe/Moscow"
ENV container=docker

COPY scripts/firstboot.sh /root

RUN adduser bitrix && \
    yum install -y openssh-server && \
    echo "bitrix:$SSH_PASS" | chpasswd && \
    echo "root:$SSH_PASS" | chpasswd && \
    cp -f /usr/share/zoneinfo/$TIMEZONE /etc/localtime && \
    chmod +x /root/firstboot.sh && \
    chmod +x /etc/rc.d/rc.local && \
    echo "if [ -f /root/firstboot.sh ]" >> /etc/rc.d/rc.local && \
    echo "then" >> /etc/rc.d/rc.local && \
    echo "     /root/firstboot.sh" >> /etc/rc.d/rc.local && \
    echo "fi" >> /etc/rc.d/rc.local

CMD "/sbin/init"
