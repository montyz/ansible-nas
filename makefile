# install ansible with nix home manager, easier than the docker way
# pre-requisites-> make reqs 
# ansible-playbook --user monty -i inventories/server0/inventory -e @inventories/server0/secrets_file.enc --ask-vault-pass nas.yml -b
# shell for debugging-> bash 
# ssh key sharing via https://medium.com/trabe/use-your-local-ssh-keys-inside-a-docker-container-ea1d117515dc
# use ansible-vault with inventories/server0/secrets_file.enc for secrets
all:
	ansible-playbook --user monty -i inventories/server0/inventory -e @inventories/server0/secrets_file.enc --ask-vault-pass nas.yml -b

samba:
	ansible-playbook --user monty -t samba -i inventories/server0/inventory -e @inventories/server0/secrets_file.enc --ask-vault-pass nas.yml -b

timemachine:
	ansible-playbook --user monty -t timemachine -i inventories/server0/inventory -e @inventories/server0/secrets_file.enc --ask-vault-pass nas.yml -b

jellyfin:
	ansible-playbook --user monty -t jellyfin -i inventories/server0/inventory -e @inventories/server0/secrets_file.enc --ask-vault-pass nas.yml -b
	
plex:
	ansible-playbook --user monty -t plex -i inventories/server0/inventory -e @inventories/server0/secrets_file.enc --ask-vault-pass nas.yml -b

youtubedlmaterial:
	ansible-playbook --user monty -t youtubedlmaterial -i inventories/server0/inventory -e @inventories/server0/secrets_file.enc --ask-vault-pass nas.yml -b

portainer:
	ansible-playbook --user monty -t portainer -i inventories/server0/inventory -e @inventories/server0/secrets_file.enc --ask-vault-pass nas.yml -b

minidlna:
	ansible-playbook --user monty -t minidlna -i inventories/server0/inventory -e @inventories/server0/secrets_file.enc --ask-vault-pass nas.yml -b

glances:
	ansible-playbook --user monty -t glances -i inventories/server0/inventory -e @inventories/server0/secrets_file.enc --ask-vault-pass nas.yml -b

resilio:
	ansible-playbook --user monty -t resilio -i inventories/server0/inventory -e @inventories/server0/secrets_file.enc --ask-vault-pass nas.yml -b

openssh:
	ansible-playbook --user monty -t openssh -i inventories/server0/inventory -e @inventories/server0/secrets_file.enc --ask-vault-pass nas.yml -b

silverbullet:
	ansible-playbook --user monty -t silverbullet -i inventories/server0/inventory nas.yml -b

audioserve:
	ansible-playbook --user monty -t audioserve -i inventories/server0/inventory -e @inventories/server0/secrets_file.enc --ask-vault-pass nas.yml nas.yml -b


reqs:
	ansible-galaxy install -r requirements.yml

decrypt_secrets:
	ansible-vault decrypt inventories/server0/secrets_file.enc

encrypt_secrets:
	ansible-vault encrypt inventories/server0/secrets_file.enc
