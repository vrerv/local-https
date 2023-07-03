# Local Https Demo

## Description

* https://www.vrerv.com/blog/self-signed-cert-in-local-https-site-development/

## Usage

Only works in bash shell. you need python3 and docker installed.

* modify `setup.sh` to change the domain name and service port.
* run `setup.sh` to generate certificates and configure nginx virtual host
* add generated `/root/rootCA.pem` to your OS's trusted root CA store - check the link above for details
* run `run-test-server.sh 3001` to run demo web server using python http.server
* run `run-docker-nginx.sh` to run nginx docker container
