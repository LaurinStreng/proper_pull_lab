# Ansible

## Deployment

To Deploy execute `./deploy HOST`

## Prerequisite

To Deploy with ansible you need to have it installed.
Use the Dotfiles Repo [https://github.com/LaurinStreng/dotfiles] to install it.

## Prerequisite - Pub Key

In the root User the .ssh folder needs to be created.
Then in the authorized_keys file the pub key muste be posted.

`mkdir .ssh`

`nano authorized_keys`

## Prerequisite -Private Key

You need to create the ansible_deployment_key file in the current directory.
In this File the Private Deployment Key must be stored.
The File is git ignored.
