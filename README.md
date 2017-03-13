# EASY-EC2 Utilities

### Easy Shell control of AWS EC2 Instances

These utilities make it easy to list and control EC2 instances from the shell.  For example:  `aws-list` will list all of your instances, `aws-list running` will list running instances, while `aws-start Ubuntu` will start your instance named "Ubuntu"

Using the AWS CLI commands is cumbersome for developers and users who perform simple tasks like checking instance status, starting/stopping them, or connecting via ssh.

*With these utilities, these simple tasks, can be completed, simply.*

#### Utilities:

- **aws-list**  - list all EC2 instances and basic information for each
- **aws-info**  - displays information for a specific instance  
- **aws-start** - starts a referenced instance
- **aws-stop**  - stops a referenced instance
- **aws-ssh**   - connect (vis ssh) to a referenced instance

#### Compatibility:

These utilities have been tested on Linux and macOS.  They are written in Bash and utilize the AWS CLI Interface commands.  This requires installation of the AWS CLI - https://aws.amazon.com/cli/

These utilities may work on Windows 10 within Bash on Windows, but this has not yet been tested.  Information on getting the AWS CLI installed into Bash on Windows is discussed here: https://github.com/aws/aws-cli/issues/1323

#### Installation:

Install and configue AWS-CLI, and place its configuration file and `.pem` file in the `~/.aws/` directory
Source the AWS-CLI configuration file from the `.bashrc` or `.bash_profile` files
Place the scripts in the PATH (like `/usr/local/bin`) or reference them directly (such as: `./aws-list`).

#### Future Enhancements:
- option to ssh with allowed certficates, but withour PEM file
- option to select instance via any tag & any value
- 'quiet mode' with no output for use by other scripts
- additional utility to allow 'setting' or 'changing' instance names and other tags
- enhance error checking and error handling  
