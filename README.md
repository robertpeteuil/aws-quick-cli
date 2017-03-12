# EC2-by-Name Utilities

### Easy Shell control of AWS EC2 Instances

These utilities make it easy to list and control EC2 instances from the shell.  For example:  `aws-list` will list all of your instances, `aws-list running` will list only running instances, while `aws-start Ubuntu` will start your instance named "Ubuntu"

Using the AWS CLI commands is cumbersome for developers and casual users, who generally perform simple tasks like checking instance status, starting/stopping instances, or connecting to instances.

*With these utilities, these simple tasks, can be completed, simply.*

#### Utilities:

- **aws-list** - list all EC2 instances and basic information for each
- **aws-info** - displays information for a specific instance  
- **aws-start** - starts a referenced instance
- **aws-stop** - stops a referenced instance
- **aws-ssh** - connect (vis ssh) to a referenced instance

#### Compatibility:

These utilities have been tested on Linux and macOS.  They are written in Bash and utilize the AWS CLI Interface commands.  This requires that AWS CLI is installed. https://aws.amazon.com/cli/

These utilities may work on Windows 10 within the Bash on Windows feature, but this has not yet been tested.  Information on getting the AWS CLI installed into Bash on Windows can be found here: https://github.com/aws/aws-cli/issues/1323

#### Installation:

Simple place the scripts somewhere in the PATH, or reference them directly (such as: `./aws-list`).

#### Future Enhancements:
- 'quiet mode' with no output for use by other scripts
- additional utility to allow 'setting' or 'changing' instance names and other tags
- enhance error checking and error handling  
