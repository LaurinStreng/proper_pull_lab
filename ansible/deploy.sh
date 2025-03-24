#! /bin/bash

HOST=${1}

if [ -z "$HOST" ]; then
  echo "Please provide a Host or use all to deploy to all hosts"
  exit 1
fi

ansible-playbook site.yml --inventory-file ./hosts.yml --private-key ./ansible_deployment_key --limit "$HOST"
