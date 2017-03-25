#!/usr/bin/env bash

# aws-quick-cli-init.sh - define vars used by all utils
#
#    from: aws-quick-cli
#          https://github.com/robertpeteuil/aws-quick-cli
#
#  Author: Robert Peteuil   @RobertPeteuil
#

# Do not run if executed directly
[[ $_ == "$0" ]] && exit 1


############################################################
###   TURN ON COLOR IF POSSIBLE, SET THEME

if test -t 1; then            # check if stdout is a terminal
  ncolors=$(tput colors)    # see if it supports colors
  if test -n "$ncolors" && test "$ncolors" -ge 8; then
  # Set Colors
    bold="$(tput bold)"
    red="$(tput setaf 1)"
    green="$(tput setaf 2)"
    yellow="$(tput setaf 3)"
    blue="$(tput setaf 4)"
    magenta="$(tput setaf 5)"
    cyan="$(tput setaf 6)"
    white="$(tput setaf 7)"
  # Set Color Theme - used by echo statements
    CLRnormal=${bold}${white}
    CLRheading=${bold}${green}
    CLRheading2=${bold}${blue}
    CLRtitle=${bold}${cyan}
    CLRtitle2=${bold}${yellow}
    CLRsuccess=${bold}${green}
    CLRwarning=${bold}${yellow}
    CLRerror=${bold}${red}
  fi
fi

############################################################
###   COMMON FUNCTIONS

display_ver() {
  echo -e "${CLRheading}${scriptname}${CLRnormal}  ver ${CLRtitle}${scriptbuildnum} ${CLRnormal}- ${CLRtitle}${scriptbuilddate}${CLRnormal}"
}
