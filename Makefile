VERSION := 2.2
DOCKER_REPO := evfreaks/itms-transporter
DOCKER_TAG := ${VERSION}

ITMS_INSTALLER := iTMSTransporter_installer_linux_2.2.0.10.sh

.PHONY: build all

all: build push

build:
	docker build -t ${DOCKER_REPO}:${DOCKER_TAG} --build-arg ITMS_INSTALLER="${ITMS_INSTALLER}" .

push:
	docker push ${DOCKER_REPO}:${DOCKER_TAG}
	docker tag ${DOCKER_REPO}:${DOCKER_TAG} ${DOCKER_REPO}:latest
	docker push ${DOCKER_REPO}:latest
