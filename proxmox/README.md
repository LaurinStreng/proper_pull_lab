## Tokens

To Configure the proxmox provider, the following shoud be placed in the prod.tfvars file:

```
virtual_environment_api_token = ""
virtual_environment_endpoint  = ""
```

## How to use:

`tofu init`  # Init of Local env
`tofu plan`  # Plan the apply view Changes
`tofu apply` # Apply the Change

## Datastores:

- local # Local NVME Disk mnt on /
- local_lvm # Local NVME Disk not mnt for VM Image
- nvme # RAID 1 ZFS NVME Disks
