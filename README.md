# AWS quick CLI
### Easily Control and ssh to AWS Instances using their Name
[![Code Climate](https://codeclimate.com/github/robertpeteuil/aws-quick-cli/badges/gpa.svg?style=flat-square)](https://codeclimate.com/github/robertpeteuil/aws-quick-cli)
[![GitHub issues](https://img.shields.io/github/issues/robertpeteuil/aws-quick-cli.svg)](https://github.com/robertpeteuil/aws-quick-cli)
[![GitHub release](https://img.shields.io/github/release/robertpeteuil/aws-quick-cli.svg?colorB=1c64bf)](https://github.com/robertpeteuil/aws-quick-cli)
[![lang](https://img.shields.io/badge/language-bash-89e051.svg?style=flat-square)]()
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
- Windows 10 'Bash on Windows' environment

### Aws-Quick-CLI Utilities Installation:

Dependancies
- These utilities require the AWS CLI utilities.
- If they are not installed, please refer to the installation instructions at the bottom of this README.
- Check here for more information on [AWS-CLI](https://aws.amazon.com/cli/)

The utilities in the repo can be installed with curl

```shell
$ bash -c "`curl -s -L https://raw.github.com/robertpeteuil/aws-quick-cli/master/install.sh`"
```

If the repo has been downloaded locally, cd into the directory and run install.sh

```shell
$ cd aws-quick-cli
$ ./install.sh
```

### Reference - Installation of AWS-CLI (if necessary)

Note for Windows 10 - Bash on Windows users: 
- Installation requires the `unzip` command, which may not be installed on your system
- If necessary, you can install it by typing `sudo apt install unzip` 

If you have `sudo` capabilties install the AWS-CLI with the following commands:

```shell
$ cd ~
$ mkdir tmpawsinstall
$ cd tmpawsinstall
$ curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
$ unzip awscli-bundle.zip
$ sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
$ cd ..
$ rm -rf tmpawsinstall
```

If you don't have `sudo` privledges install the AWS-CLI with the following commands:

```shell
$ cd ~
$ mkdir tmpawsinstall
$ cd tmpawsinstall
$ curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
$ unzip awscli-bundle.zip
$ ./awscli-bundle/install -b ~/bin/aws
$ cd ..
$ rm -rf tmpawsinstall
```

Note: the non-sudo installation requires that you add the `~/bin` directory to your PATH via your shell profile (either ~/.profile, ~/.bash_profile or ~/.bash_rc depending on your OS.)

Configure the AWS CLI utilities using your AWS Access Key ID # and AWS Secret Access Key and the command:

```shell
$ aws configure
```

Check here for more information on [configuring the AWS-CLI](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-quick-configuration)

