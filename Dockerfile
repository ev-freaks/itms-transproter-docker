FROM java:8-jre as base
LABEL author=remus@ev-freaks.com

ARG ITMS_INSTALLER "iTMSTransporter_installer_linux_2.2.0.10.sh"

RUN apt-get update ; apt-get install -y make ; rm -rf /var/lib/apt/lists/*

FROM base as builder
RUN apt-get update ; apt-get install -y sudo expect

COPY install.expect /home/iTMSTransporter_installer_linux/
COPY "${ITMS_INSTALLER}" /home/iTMSTransporter_installer_linux/iTMSTransporter_installer.sh

RUN cd /home/iTMSTransporter_installer_linux/ \
	&& chmod +x iTMSTransporter_installer.sh \
	&& expect install.expect

FROM base as release

COPY --from=builder /usr/local/itms/ /usr/local/itms/
RUN ln -s /usr/local/itms/bin/iTMSTransporter /usr/local/bin/iTMSTransporter