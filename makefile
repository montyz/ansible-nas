all:
	ansible-playbook -i inventories/server0/inventory nas.yml -b

samba:
	ansible-playbook -t samba -i inventories/server0/inventory nas.yml -b

plex:
	ansible-playbook -t plex -i inventories/server0/inventory nas.yml -b

reqs:
	ansible-galaxy install -r requirements.yml

