server0:
	ansible-playbook -i inventories/server0/inventory nas.yml -b

reqs:
	ansible-galaxy install -r requirements.yml

