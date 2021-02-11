all:
	ansible-playbook -i inventories/server0/inventory nas.yml -b

samba:
	ansible-playbook -t samba -i inventories/server0/inventory nas.yml -b

plex:
	ansible-playbook -t plex -i inventories/server0/inventory nas.yml -b

youtubedlmaterial:
	ansible-playbook -t youtubedlmaterial -i inventories/server0/inventory nas.yml -b

virtual_desktop:
	ansible-playbook -t virtual_desktop -i inventories/server0/inventory nas.yml -b

guacamole:
	ansible-playbook -t guacamole -i inventories/server0/inventory nas.yml -b

resilio:
	ansible-playbook -t resilio -i inventories/server0/inventory nas.yml -b

reqs:
	ansible-galaxy install -r requirements.yml

