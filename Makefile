
pre-reqs: install-pre-reqs.sh
	./install-pre-reqs.sh

clear_roles: .gitmodules
	git submodule deinit -f .

update_roles: .gitmodules clear_roles
	git submodule update --init --recursive --remote

provision:
	/bin/python2.7 /bin/ansible-playbook -vvv configure-box.yml

all: clean pre-reqs clear_roles update_roles provision

clean:
	find . -iname "{*" -exec rm -rf {} \;

.DEFAULT_GOAL := all
