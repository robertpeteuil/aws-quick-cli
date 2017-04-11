# AWS quick CLI
### Easily Control and ssh to AWS Instances using their Name
[![Code Climate](https://codeclimate.com/github/robertpeteuil/aws-quick-cli/badges/gpa.svg?style=flat-square)](https://codeclimate.com/github/robertpeteuil/aws-quick-cli)
[![GitHub issues](https://img.shields.io/github/issues/robertpeteuil/aws-quick-cli.svg)](https://github.com/robertpeteuil/aws-quick-cli)
[![GitHub release](https://img.shields.io/github/release/robertpeteuil/aws-quick-cli.svg?colorB=1c64bf)](https://github.com/robertpeteuil/aws-quick-cli)
[![lang](https://img.shields.io/badge/language-bash-89e051.svg?style=flat-square)]()
[![license](https://img.shields.io/github/license/robertpeteuil/aws-quick-cli.svg?colorB=1c64bf)](https://github.com/robertpeteuil/aws-quick-cli)

---

These utilities allow you to easily manage and use EC2 instances using only their name.  It includes utilities for listing, connecting (via ssh), and starting/stopping instances.

If multiple instances have the same NAME,  matching instances are listed and the user is allowed to choose the instance on which the action is performed.  ex: `aws-start Ubuntu` when you have two instances with NAME="Ubuntu".

### Screenshot of aws-list:
![](https://cloud.githubusercontent.com/assets/1554603/24174034/db095af6-0e4b-11e7-8e66-fdfa1d8eecae.png)

### Utility Overview:

The utilities are executed by typing the utility name followed by the instance-name. ex: `aws-ssh NAME` and `aws-start NAME`  

Utilities are included for:
* SSH to an Instance: **aws-ssh**
  * automatically determines login-name based upon the instance image-type
  * allows specifying a specific login-name
  * supports connecting without PEM keys
* List Instances: **aws-list**
  * can list all instance, running instances, or stopped instances
  * can list only instances with a specific name
* Start Instance: **aws-start**
* Stop Instance: **aws-stop**

### Supported Platforms:

- Linux
- macOS (OS X)
- Windows 10 'Bash on Windows'

### Installation:

Pre-Requisites:
- The AWS CLI utilities must installed and configured on the system
- Instructions for installing the AWS-CLI utilities are included at the bottom of this README in the section *Reference - Installation of AWS-CLI*

The utilities in the repo can be installed with curl

```shell
$ bash -c "`curl -s -L https://raw.github.com/robertpeteuil/aws-quick-cli/master/install.sh`"
```

If the repo has been downloaded locally, cd into the directory and run install.sh

```shell
$ cd aws-quick-cli
$ ./install.sh
```

### Reference: Utility Details

**aws-ssh** - connects to a name-specified AWS EC2 instance via ssh

```text
USAGE: aws-ssh instance-name [-n] [-u login-user] [-d] [-v] [-h]

 instance-name	: (REQUIRED) name tag assigned to instance

        OPTIONS:
 -u login-user	: (optional) specify a login-username
            -n	: Dont use PEM key while connecting *
            -d	: debug mode
            -v	: display version info
            -h	: display help info

* Note: for users who have appended their ssh-rsa.pub key to 'authorized_keys' on the remote host
```

**aws-list** - list status and information for AWS EC2 instances

```text
USAGE: aws-list (none)| instance-name | -s | -r  [OPTIONS]

SELECT LIST TYPE:
       (none)	: list all instances
instance-name	: info for a specific instance
           -s	: list stopped instances
           -r	: list running instances

        OPTIONS:
           -d	: debug mode
           -v	: display version info
           -h	: display help info
```

**aws-start** - STARTS the specified AWS EC2 instance

```text
USAGE: aws-start instance-name [-v] [-h]

        OPTIONS:
 instance-name	: (REQUIRED) name tag assigned to instance
            -v	: display version info
            -h	: display help info
```

**aws-stop** - STOPS the specified AWS EC2 instance

```text
USAGE: aws-stop instance-name [-v] [-h]

        OPTIONS:
 instance-name	: (REQUIRED) name tag assigned to instance
            -v	: display version info
            -h	: display help info
```

### Reference - Installation of AWS-CLI

AWS-CLI Installation Pre-Requisites:
- Installation requires Python 2 version 2.6.5+ or Python 3 version 3.3+
- Installation requires the `unzip` command, which can be installed by typing `sudo apt install unzip`
- Check here for detailed installation instructions on the [AWS Website](http://docs.aws.amazon.com/cli/latest/userguide/installing.html)

#### Installation commands If you have `sudo` capabilities:

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

#### Installation commands for users without `sudo` capabilities:

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

#### Configure the AWS CLI utilities
- Configuration requires using your AWS Access Key ID # and AWS Secret Access Key
- If you dont have these, check here for more information on getting started with [AWS-CLI](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-set-up.html)
- Check here for more information on [configuring the AWS-CLI](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-quick-configuration)

To configure the AWS-CLI run the command:

```shell
$ aws configure
```
