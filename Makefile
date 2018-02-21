clear_roles: .gitmodules
	git submodule deinit -f .

update_roles: .gitmodules clear_roles
	git submodule update --init --recursive
