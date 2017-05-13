# AWS Quick CLI
### Easily control and ssh to AWS instances using their Name
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/a7b3d53ab89a4b758766c238173175cc)](https://www.codacy.com/app/robertpeteuil/aws-quick-cli?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=robertpeteuil/aws-quick-cli&amp;utm_campaign=Badge_Grade)
[![GitHub issues](https://img.shields.io/github/issues/robertpeteuil/aws-quick-cli.svg)](https://github.com/robertpeteuil/aws-quick-cli)
[![GitHub release](https://img.shields.io/github/release/robertpeteuil/aws-quick-cli.svg?colorB=1c64bf)](https://github.com/robertpeteuil/aws-quick-cli)
[![lang](https://img.shields.io/badge/language-bash-89e051.svg?style=flat-square)](https://github.com/robertpeteuil/aws-quick-cli)
[![license](https://img.shields.io/github/license/robertpeteuil/aws-quick-cli.svg?colorB=1c64bf)](https://github.com/robertpeteuil/aws-quick-cli)

---

AWS Quick CLI allows listing, starting, stopping and connecting to instances by name or instance-id.

### Example of `aws-list` sub-utility:
![](https://cloud.githubusercontent.com/assets/1554603/24174034/db095af6-0e4b-11e7-8e66-fdfa1d8eecae.png)

### Overview:

This utility suite consists of four utilities: `aws-list`, `aws-start`, `aws-stop`, and `aws-ssh`.

- SSH to an Instance: `aws-ssh NAME` or `aws-ssh -i ID`

  - Additional parameters described in Details

- List Instances: `aws-list`

  - Additional parameters described in Details

- Start Instance: `aws-start NAME` or `aws-start -i ID`
- Stop Instance: `aws-stop NAME` or `aws-stop -i ID`

### Details

- SSH to Instance: `aws-ssh NAME` or `aws-ssh -i ID`

  - automatically calculates login-name based on the image-type of the instance
  - override the calculated login-name `-u USERNAME`
  - connect without PEM keys (if properly configured) `-p`
  - command specific help `aws-ssh -h`

- List Instances: `aws-list`

  - list all instances (default).
  - list running instances `-r` or `--running`
  - list stopped instances `-s` or `--stopped`
  - list instances with specified name `aws-list NAME`
  - list instance with specified instance-id `aws-list -i ID`
  - command specific help `aws-list -h`

- Start Instance: `aws-start NAME` or `aws-start -i ID`

  - start instance by name or instance-id
  - command specific help `aws-start -h`

- Stop Instance: `aws-stop NAME` or `aws-stop -i ID`

  - start instance by name or instance-id
  - command specific help `aws-stop -h`


### Supported Platforms:

- Linux
- macOS (OS X)
- Windows 10 'Bash on Windows'

### Pre-Requisites:

- The AWS CLI utilities must installed and configured
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

### Reference - Installation of AWS-CLI

##### Pre-Requisites:

- Installation requires Python 2 version 2.6.5+ or Python 3 version 3.3+
- Installation requires the `unzip` command, which can be installed by typing `sudo apt-get install unzip`
- **Do not install the AWS CLI via a package manager** - this may install an outdated version that's incompatible with these utilities.
- For help or additional instruction see the [AWS Website](http://docs.aws.amazon.com/cli/latest/userguide/installing.html)

#### Installation with `sudo` capabilities:

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

#### Installation without `sudo` capabilities:

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

Additional steps for non-sudo installations:

- manually add the `~/bin` directory to your PATH
- This is performed by editing your shell profile
  - This file is either `~/.profile`, `~/.bash_profile` or `~/.bash_rc` depending on your OS.

#### Configure the AWS CLI utilities

- Configuration requires using your AWS Access Key ID # and AWS Secret Access Key and running the command: `aws configure`
- If you don't have these, refer to the [AWS getting started page](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-set-up.html)
- Check here for more information on [configuring the AWS-CLI](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-quick-configuration)
