VERSION := 2.2
DOCKER_REPO := evfreaks/itms-transporter:${VERSION}
ITMS_INSTALLER := iTMSTransporter_installer_linux_2.2.0.10.sh

.PHONY: build all

all: build

build:
	docker build -t ${DOCKER_REPO} --build-arg ITMS_INSTALLER="${ITMS_INSTALLER}" .


