# AWS quick CLI
### Easily Control and ssh to AWS Instances using their Name
[![Code Climate](https://codeclimate.com/github/robertpeteuil/aws-quick-cli/badges/gpa.svg?style=flat-square)](https://codeclimate.com/github/robertpeteuil/aws-quick-cli)
[![GitHub issues](https://img.shields.io/github/issues/robertpeteuil/aws-quick-cli.svg)](https://github.com/robertpeteuil/aws-quick-cli)
[![version: master](https://img.shields.io/github/tag/robertpeteuil/aws-quick-cli.svg?label=stable+version&colorB=1c64bf&style=flat "stable version")](https://github.com/robertpeteuil/aws-quick-cli/commits/master)
[![language: bash](https://img.shields.io/badge/language-bash-447799.svg?colorB=1c64bf&style=flat "made in Bash")]()
[![license](https://img.shields.io/github/license/robertpeteuil/aws-quick-cli.svg?colorB=1c64bf)](https://github.com/robertpeteuil/aws-quick-cli)

---

These utilities allow you to easily manage and use EC2 instances using only their name.  It includes utilities for listing, connecting (via ssh), starting, and stopping instances.  

### Screenshot of aws-list:
![aws-list](https://cloud.githubusercontent.com/assets/1554603/24174034/db095af6-0e4b-11e7-8e66-fdfa1d8eecae.png)

### Utility Details:

The utilities can be executed by typing in the utility-name and instance-name - such as `aws-start NAME` and `aws-ssh NAME`.

**aws-ssh** - connect (vis ssh) to a referenced instance. The default syntax for this utility is very simple, but it has several optional parameters.

> `aws-ssh NAME` - connect via ssh to the instance tagged NAME
>
> `aws-ssh NAME -u LOGINUSER` - use LOGINUSER in the ssh command
>
> `aws-ssh NAME -n` - *No PEM key Mode*  For users who have appended their id-rsa.pub key to authorized_keys on the remote host
> 
> `aws-ssh NAME -d` - *debug mode* - allows troubleshooting connection problems by displaying calculated values within the utility

**aws-list** - lists instances and displays basic information for each including: Name, InstanceId, Status (Running/Stopped), AMI-ID, and AMI-Name.  

> `aws-list` - list all instances    
> `aws-list running` - list all running instances     
> `aws-list stopped` - list all stopped instances      

**aws-info** - displays the same information as *aws-list*, but only for a specific instance.  

> `aws-info NAME` - displays information for the instance tagged NAME  
> `aws-info -i i-0bf64f60ab4174fc5` - displays information for the instance with the InstanceId provided

**aws-start** - starts the instance specified.     

> `aws-start NAME` - starts the instance tagged NAME

**aws-stop** - stops the instance specified.  

> `aws-stop NAME` - stops the instance tagged NAME

### Supported Platforms:

- Linux
- macOS (OS X)

*Note:* These utilities require the AWS CLI utilities.  Information on [AWS-CLI](https://aws.amazon.com/cli/)

**Windows 10 with "Bash on Windows" (unsupported)**
- this platform has not been tested, but the utilities should run if AWS-CLI is properly installed
- the AWS-CLI utilities must be installed into "Bash on Windows" not the Windows host machine
- Check here for information regarding [installation of AWS-CLI on Bash on Windows](https://github.com/aws/aws-cli/issues/1323)

### Installation:

- Install and configure AWS-CLI, and place the configuration file and `.pem` key into the `~/.aws/` directory
- Make sure this configuration file is sourced from `.bashrc` or `.bash_profile` 
- Copy these utilities to a directory in the PATH.  For example, the `/usr/local/bin` directory

