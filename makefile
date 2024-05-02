# pre-requisites-> make reqs 
# docker-compose run ansible ansible-playbook --user monty -i /work/inventories/server0/inventory nas.yml -b
# shell for debugging-> docker-compose run ansible bash 
# ssh key sharing via https://medium.com/trabe/use-your-local-ssh-keys-inside-a-docker-container-ea1d117515dc
all:
	docker-compose run ansible ansible-playbook --user monty -i inventories/server0/inventory nas.yml -b

samba:
	docker-compose run ansible ansible-playbook --user monty -t samba -i inventories/server0/inventory nas.yml -b

timemachine:
	docker-compose run ansible ansible-playbook --user monty -t timemachine -i inventories/server0/inventory nas.yml -b

jellyfin:
	docker-compose run ansible ansible-playbook --user monty -t jellyfin -i inventories/server0/inventory nas.yml -b
	
plex:
	docker-compose run ansible ansible-playbook --user monty -t plex -i inventories/server0/inventory nas.yml -b

youtubedlmaterial:
	docker-compose run ansible ansible-playbook --user monty -t youtubedlmaterial -i inventories/server0/inventory nas.yml -b

portainer:
	docker-compose run ansible ansible-playbook --user monty -t portainer -i inventories/server0/inventory nas.yml -b

minidlna:
	docker-compose run ansible ansible-playbook --user monty -t minidlna -i inventories/server0/inventory nas.yml -b

glances:
	docker-compose run ansible ansible-playbook --user monty -t glances -i inventories/server0/inventory nas.yml -b

resilio:
	docker-compose run ansible ansible-playbook --user monty -t resilio -i inventories/server0/inventory nas.yml -b

openssh:
	docker-compose run ansible ansible-playbook --user monty -t openssh -i inventories/server0/inventory nas.yml -b

silverbullet:
	docker-compose run ansible ansible-playbook --user monty -t silverbullet -i inventories/server0/inventory nas.yml -b

reqs:
	docker-compose run ansible ansible-galaxy install -r requirements.yml

