# RKE2 Build

---

These scripts uses Terraform to automate building of rke2 clusters on AWS, it supports building normal and HA clusters with N master nodes, N workers nodes.

The scripts are simplified into one module that supports both server and agent nodes, the scripts also support building multiple clusters.

## rke2

The rke2 module is the only module in the scripts and it builds the following components:

- N servers
- Autoscaling group to build N agents
- Load balancer to proxy to rke2 servers
- Domain name to resolve to the load balancer

## Variables

The scripts can be modified by customizing the variables in `scripts/config`, the variables includes:


|       Name       |                                   Description                                  |
|:----------------:|:------------------------------------------------------------------------------:|
|   CLUSTER_SECRET |     The cluster secret token used by servers and agents to connect to each other    |
|    DOMAIN_NAME   |                 DNS name of the Loadbalancer for rke2 master(s)                 |
|      ZONE_ID     |                 AWS route53 zone id for modifying the dns name                 |
|    RKE2_VERSION   |                RKE2 version that will be used with the cluster                 |
|  EXTRA_SSH_KEYS  |                Public ssh keys that will be added to the servers               |
|       DEBUG      |                           Debug mode for rke2 servers                           |

### RKE2 Server Variables

|         Name         |                                    Description                                    |
|:--------------------:|:---------------------------------------------------------------------------------:|
|       SERVER_HA      | Whether or not to use HA mode, if not then sqlite will be used as storage backend |
|     SERVER_COUNT     |                               rke2 master node count                               |
| SERVER_INSTANCE_TYPE |                    Ec2 instance type created for rke2 server(s)                    |

### RKE2 Agent Variables

|         Name        |                Description                |
|:-------------------:|:-----------------------------------------:|
|   AGENT_COUNT  | Number of RKE2 agents that will be created |
| AGENT_INSTANCE_TYPE |  Ec2 instance type created for rke2 agents |

## Usage

### build

The scripts contain a makefile to simplify building and destroying the servers, first adjust the config in scripts/config file, then run the following command to build the cluster

```bash
make build NAME="<name>"
```

This will basically create a directory in the same dir which represent the cluster and run terrafrom from within this dir, a cluster will be created using the info supplied in scripts/config.

### destroy

To destroy the cluster just run the following:

```bash
make destroy NAME="<name>"
```

