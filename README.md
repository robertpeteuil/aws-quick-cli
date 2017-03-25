# AWS quick CLI
### Easily Control and ssh to AWS Instances using their Name
[![Code Climate](https://codeclimate.com/github/robertpeteuil/aws-quick-cli/badges/gpa.svg?style=flat-square)](https://codeclimate.com/github/robertpeteuil/aws-quick-cli)
[![GitHub issues](https://img.shields.io/github/issues/robertpeteuil/aws-quick-cli.svg)](https://github.com/robertpeteuil/aws-quick-cli)
[![GitHub release](https://img.shields.io/github/release/robertpeteuil/aws-quick-cli.svg?colorB=1c64bf)](https://github.com/robertpeteuil/aws-quick-cli)
[![language: bash](https://img.shields.io/badge/language-bash-447799.svg?colorB=1c64bf&style=flat "made in Bash")]()
[![license](https://img.shields.io/github/license/robertpeteuil/aws-quick-cli.svg?colorB=1c64bf)](https://github.com/robertpeteuil/aws-quick-cli)

---

These utilities allow you to easily manage and use EC2 instances using only their name.  It includes utilities for listing, connecting (via ssh), starting, and stopping instances.  

### Screenshot of aws-list:
![](https://cloud.githubusercontent.com/assets/1554603/24174034/db095af6-0e4b-11e7-8e66-fdfa1d8eecae.png)

### Utility Details:

The utilities are executed by typing in thir name follower by the instance-name - such as `aws-start NAME` and `aws-ssh NAME`

**aws-ssh** - connect to an instance (via ssh)

> `aws-ssh NAME` - connect via ssh to the instance tagged NAME
>
> `aws-ssh NAME -u LOGINUSER` - override default user and use LOGINUSER instead
>
> `aws-ssh NAME -n` - Connect without submitting PEM key (for users who have appended their id-rsa.pub key to authorized_keys on the remote host)
> 
> `aws-ssh NAME -d` - *debug mode* - allows troubleshooting connection problems by displaying calculated values used within the utility

**aws-list** - list instances and display information for each

> `aws-list` - list all instances    
> `aws-list running` - list all running instances     
> `aws-list stopped` - list all stopped instances      

**aws-info** - display information for a specific instance

> `aws-info NAME` - displays information for the instance NAME  
> `aws-info -i INSTANCEID` - displays information for instance with the ID of INSTANCEID

**aws-start** - start an instance

> `aws-start NAME` - starts the instance NAME

**aws-stop** - stop an instance

> `aws-stop NAME` - stops the instance NAME

### Supported Platforms:

- Linux
- macOS (OS X)

### Dependancies:

These utilities require the AWS CLI utilities installed and configured.  Check here for more information on [AWS-CLI](https://aws.amazon.com/cli/)

### Windows 10 - Bash on Windows - Pre-Installation Steps:

- Install AWS-CLI into "Bash on Windows" (not the Windows OS itself)
  - Check here for information on the [installation of AWS-CLI on Bash on Windows](https://github.com/aws/aws-cli/issues/1323)

### Installation:

Can be install with curl

```shell
bash -c "`curl -s -L https://raw.github.com/robertpeteuil/aws-quick-cli/master/install.sh`"
```

If the repo has been downloaded locally, cd into the directory and run install.sh

```shell
cd aws-quick-cli
./install.sh
```

