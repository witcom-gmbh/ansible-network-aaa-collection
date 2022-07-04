RELEASE         ?= $(shell cat ./release.version)

all: clean build

clean:
	rm -f witcom-*.tar.gz

release_prepare:
	@sed "s/RELEASE/${RELEASE}/g" ./galaxy.yml.in > ./galaxy.yml
	#todo: check for release in changelog

test: clean build
	cd tests && ansible-galaxy collection install ../witcom-network_aaa-$(RELEASE).tar.gz --force
	cd tests && ansible-playbook -i hosts test.yml 

build:
	ansible-lint -x yaml --exclude ./tests
	@sed "s/RELEASE/${RELEASE}/g" ./galaxy.yml.in > ./galaxy.yml
	ansible-galaxy collection build
