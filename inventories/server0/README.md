# server0 initial setup

## Install ubuntu 20.4 LTS

- manual <https://downloads.dell.com/manuals/all-products/esuprt_ser_stor_net/esuprt_poweredge/poweredge-t110-2_owner%27s%20manual_en-us.pdf>
- had to enable usb ports and ethernet from system setup
- kept bios, uefi made grub come up
- if re-installing, use F2 to choose a USB drive, it can't be plugged in the front, only back or internal
- after installing I had to use Ctl-C during SAS controller start to make the installed drive bootable, then had to use F2 to choose that drive to boot from

## Install openssh-server
- guide <https://help.ubuntu.com/community/SSH/OpenSSH/Configuring>

```bash
sudo apt install openssh-server
```

- edited `/etc/ssh/sshd_config` to disable password login

- copied pub key to `~/.ssh/authorized-keys`
- restarted sshd `sudo systemctl restart ssh`

## Set up ansible

- use existing user with sudo
- `sudo visudo /etc/sudoers.d/90-ansible-monty`:

    ```bash
    monty ALL=(ALL) NOPASSWD:ALL
    ```

- learned you can't have a dot in the filename such as `/etc/sudoers.d/90-ansible-monty.conf` -- it will be ignored
- followed instructions at <https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-ubuntu>

    ```bash
    sudo apt update
    sudo apt install software-properties-common
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    sudo apt install ansible
    ```

- sample `hosts` and `ansible.cfg` files available at <https://github.com/ansible/ansible/tree/devel/examples>

## installed mergerfs and fstab

- see <https://perfectmediaserver.com/installation/manual-install/>
- installed mergerfs

    ```bash
    ## Download and install - ensure to update version number!
    wget https://github.com/trapexit/mergerfs/releases/download/2.32.2/mergerfs_2.32.2.ubuntu-focal_amd64.deb
    sudo dpkg -i mergerfs_2.32.2.ubuntu-focal_amd64.deb

    ## Verify installation
    alex@cartman:~$ apt list mergerfs
    Listing... Done
    mergerfs/now 2.32.2~ubuntu-focal amd64 [installed,local]
    ```

- burn in the drives if it's the first install <https://perfectmediaserver.com/hardware/new-drive-burnin/>
- make the filesystem if needed:

```bash
sudo apt install xfsprogs
sudo mkfs.xfs -f /dev/sdc1
sudo mkfs.xfs -f /dev/sdd1
sudo mkfs.xfs -f /dev/sde1
```

- set up mount directories

```bash
sudo mkdir /mnt/disk{1,2,3}
# sudo mkdir /mnt/storage # this will be the main mergerfs mountpoint
```

- actually mergerfs being a fuse filesystem makes nfs and docker not work, so don't bother with it
- copy/paste `templates/fstab` to end of `/etc/fstab`
- run `sudo mount -a` to check the `fstab`
- [ignore] because nfs is running on top of a fuse filesystem, I had to add `rw,sync,crossmnt,fsid=0` as the options to /etc/exports

## todo

- √ set up volumes with mergerfs
- resilio container
- minidlna
- √ plex
- ~ √ get samba working (weird it's running two sets of smbd's, see what happens on restart)
- figure out how to download via usenet
- √ dev env
- √ youtube-dl 
- set up shortcuts with heimdall
