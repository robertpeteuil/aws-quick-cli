# AWS quick CLI
### Easily control and ssh to AWS instances using their Name
[![Code Climate](https://codeclimate.com/github/robertpeteuil/aws-quick-cli/badges/gpa.svg?style=flat-square)](https://codeclimate.com/github/robertpeteuil/aws-quick-cli)
[![GitHub issues](https://img.shields.io/github/issues/robertpeteuil/aws-quick-cli.svg)](https://github.com/robertpeteuil/aws-quick-cli)
[![GitHub release](https://img.shields.io/github/release/robertpeteuil/aws-quick-cli.svg?colorB=1c64bf)](https://github.com/robertpeteuil/aws-quick-cli)
[![lang](https://img.shields.io/badge/language-bash-89e051.svg?style=flat-square)]()
[![license](https://img.shields.io/github/license/robertpeteuil/aws-quick-cli.svg?colorB=1c64bf)](https://github.com/robertpeteuil/aws-quick-cli)

---

These utilities allow you to easily manage and connect to AWS instances using their name.  It allows for listing, connecting via ssh, and starting/stopping instances.

If multiple instances have the same NAME, details for matching instances are listed and the user asked to choose the intended instance.  For example, running `aws-start Ubuntu` when there are multiple instance named Ubuntu.

### Screenshot of aws-list:
![](https://cloud.githubusercontent.com/assets/1554603/24174034/db095af6-0e4b-11e7-8e66-fdfa1d8eecae.png)

### Overview:

The utilities are executed by typing the utility name followed by the instance-name. ex: `aws-ssh NAME` and `aws-start NAME`  

Utilities are included for:

- SSH to an Instance: **aws-ssh**
  - automatically calculates the ssh login-name based upon the instance image-type
  - optionally over-ride the calculated login-name
  - optionally connect without PEM keys (if properly configured)
- List Instances: **aws-list**
  - list all instance
  - optionally list all running/stopped instances,
  - optionally list instances with a specified name
- Start Instance: **aws-start**
- Stop Instance: **aws-stop**

### Supported Platforms:

- Linux
- macOS (OS X)
- Windows 10 'Bash on Windows'

### Pre-Requisites:

- The AWS CLI utilities must installed and configured on the system
  - **Do not install the AWS CLI via a package manager** - this usually installs an outdated version which will not work with these utilities.
- Instructions for installing the AWS-CLI utilities are included at the bottom of this README in the section *Reference - Installation of AWS-CLI* and or on the [AWS Website](http://docs.aws.amazon.com/cli/latest/userguide/installing.html).

## Installation:

The utilities in the repo can be installed with curl

```shell
bash -c "`curl -s -L https://raw.github.com/robertpeteuil/aws-quick-cli/master/install.sh`"
```

If the repo has been downloaded locally, cd into the directory and run install.sh

```shell
cd aws-quick-cli
./install.sh
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

       LIST TYPE:
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

  instance-name	: (REQUIRED) name tag assigned to instance

         OPTIONS:
            -v	: display version info
            -h	: display help info
```

**aws-stop** - STOPS the specified AWS EC2 instance

```text
USAGE: aws-stop instance-name [-v] [-h]

  instance-name	: (REQUIRED) name tag assigned to instance

         OPTIONS:
            -v	: display version info
            -h	: display help info
```

### Reference - Installation of AWS-CLI

AWS-CLI Installation Pre-Requisites:

- Installation requires Python 2 version 2.6.5+ or Python 3 version 3.3+
- Installation requires the `unzip` command, which can be installed by typing `sudo apt-get install unzip`
- **Do not install the AWS CLI via a package manager** - this usually installs an outdated version which will not work with these utilities.
- For help or more detailed instruction go to the [AWS Website](http://docs.aws.amazon.com/cli/latest/userguide/installing.html)

#### Installation commands for those with `sudo` capabilities:

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

Additional non-sudo installation steps:

- manually add the `~/bin` directory to your PATH
- This is performed by editing your shell profile
  - This file is either `~/.profile`, `~/.bash_profile` or `~/.bash_rc` depending on your OS.

#### Configure the AWS CLI utilities

- Configuration requires using your AWS Access Key ID # and AWS Secret Access Key and running the command: `aws configure`
- If you don't have these, refer to the [AWS getting started page](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-set-up.html)
- Check here for more information on [configuring the AWS-CLI](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-quick-configuration)
