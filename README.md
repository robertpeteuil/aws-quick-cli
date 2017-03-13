# EASY-EC2 Utilities

### Easily Manage and Connect to AWS EC2 Instances using only their Name

These utilities allow you to easily manage and use EC2 instances using only their name.  As shell utilities, they are designed to be simple and require minimal parameters; with most only requiring the Name of an Instance.  For example: `aws-ssh Ubuntu` will connect via ssh to the EC2 instance named Ubuntu.

They are extremely useful for developers, power-users, and IT professionals as the AWS CLI commands are overly cumbersome for basic administration and using the AWS Admin Portal isn't quick, scriptable, and breaks workflows.

*With these utilities, simple tasks can be completed simply.*

#### Utilities:

The functions are named for the action they perform.  Some utilities have very basic functions, such as `aws-start Hostname` and `aws-stop Hostname`.  While others leverage the capabilities of AWS CLI behind the scenes to allow you to do more complex things easily.   

Currently, there are five utilities: **aws-ssh**, **aws-list**, **aws-info**, **aws-start**, and **aws-stop** - each performing the action in their name.  These utilities and syntax options are described below.  Additionally, each utility has built in help that can be accessed with `-h`.

**aws-ssh** - connect (vis ssh) to a referenced instance. The default syntax for this utility is very simple, but it has several optional parameters.

> `aws-ssh NAME` - connect via ssh to the instance tagged NAME
> `aws-ssh NAME -u LOGINUSER` - use LOGINUSER in the ssh command
> `aws-ssh NAME -n` - *No PEM key Mode*  For users who have appended their id-rsa.pub key to authorized_keys on the remote host
> `aws-ssh NAME -d` - *debug mode* - allows troubleshooting connection problems by displaying calculated values within the utility

**aws-list** - lists instances and displays basic information for each including: Name, InstanceId, Status (Running/Stopped), AMI-ID, and AMI-Name.  There are three ways to run this utility.

> `aws-list` - list all instances    
> `aws-list running` - list all running instances     
> `aws-list stopped` - list all stopped instances      

**aws-info** - displays the same information as *aws-list*, but only for a specific instance.  There are two ways to run this utility:

> `aws-info NAME` - displays information for the instance tagged NAME  
> `aws-info -i i-0bf64f60ab4174fc5` - displays information for the instance with the InstanceId provided

**aws-start** - starts the instance specified.  There is only one syntax mode for this utility.   

> `aws-start NAME` - starts the instance tagged NAME

**aws-stop** - stops the instance specified.  Like *aws-start* there is only one syntax for this utility.

> `aws-stop NAME` - stops the instance tagged NAME

#### Compatibility:

These utilities have been tested on Linux and macOS.  They are written in Bash and utilize the AWS CLI Interface commands.  This requires installation of the AWS CLI - https://aws.amazon.com/cli/

These utilities have not been tested with Bash on Windows in Windows 10. They should work, provided AWS-CLI is properly installed into Bash on Windows.  This is discussed here: https://github.com/aws/aws-cli/issues/1323

#### Installation:

- Install and configure AWS-CLI, and place its configuration file and `.pem` file in the `~/.aws/` directory
- Source the AWS-CLI configuration file from the `.bashrc` or `.bash_profile` files
- Place the scripts in a directory in the PATH (like `/usr/local/bin`) or reference them directly in the current directory (such as: `./aws-list`).

#### Future Enhancements:
- option to select instance via any tag & any value
- 'quiet mode' with no output (for use by other scripts)
- allow 'setting' or 'changing' instance names and other tags
- enhance error checking and error handling
