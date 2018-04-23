#!/bin/bash
# install suported docker version for rancher-agent
# http://rancher.com/docs/rancher/v1.6/en/hosts/#supported-docker versions
sudo curl https://releases.rancher.com/install-docker/17.03.sh | sh
sudo usermod -a -G docker ubuntu
sudo docker run -e CATTLE_AGENT_IP="`curl http://169.254.169.254/latest/meta-data/local-ipv4/`" -e CATTLE_HOST_LABELS='compute=true' --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.2.9 http://rancher.mediaiqdigital.com/v1/scripts/TOKEN
