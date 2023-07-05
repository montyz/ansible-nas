all:
	ansible-playbook -i inventories/server0/inventory nas.yml -b

samba:
	ansible-playbook -t samba -i inventories/server0/inventory nas.yml -b

timemachine:
	ansible-playbook -t timemachine -i inventories/server0/inventory nas.yml -b

plex:
	ansible-playbook -t plex -i inventories/server0/inventory nas.yml -b

youtubedlmaterial:
	ansible-playbook -t youtubedlmaterial -i inventories/server0/inventory nas.yml -b

virtual_desktop:
	ansible-playbook -t virtual_desktop -i inventories/server0/inventory nas.yml -b

minidlna:
	ansible-playbook -t minidlna -i inventories/server0/inventory nas.yml -b

glances:
	ansible-playbook -t glances -i inventories/server0/inventory nas.yml -b

resilio:
	ansible-playbook -t resilio -i inventories/server0/inventory nas.yml -b

reqs:
	ansible-galaxy install -r requirements.yml

