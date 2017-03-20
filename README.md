# AWS quick CLI

### Easily Control and ssh to AWS Instances using their Name

These utilities allow you to easily manage and use EC2 instances using only their name.  It includes utilities for listing, connecting (via ssh), starting, and stopping instances.  

### Screenshot of aws-list:
![aws-list-new-size](https://cloud.githubusercontent.com/assets/1554603/24119697/63ef3652-0d6f-11e7-965d-0ae6fe0f5c73.png)

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

