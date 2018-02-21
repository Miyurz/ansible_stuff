pre-reqs: install-pre-reqs.sh
	./install-pre-reqs.sh

clear_roles: .gitmodules
	git submodule deinit -f .

update_roles: .gitmodules clear_roles
	git submodule update --init --recursive

provision:
	ansible-playbook configure-box.yml

all: pre-reqs clear_roles update_roles provision
