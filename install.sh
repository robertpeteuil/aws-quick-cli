#!/bin/bash

REPOACCT="robertpeteuil"
REPONAME="aws-quick-cli"
REPORTPHRASE="${REPONAME} utilities"

# exit if AWS CLI utilities not present
if ! type "aws" &> /dev/null; then
  echo "Please install AWS-CLI utilities first"
  exit
fi

CURRENTDIR="$(pwd)"
CURRENTDIR=${CURRENTDIR##*\/}
UTILTMPDIR="${REPOACCT}-${REPONAME}"

cleanupDownload() {
  cd "${TMPDIR}" || exit 1
  rm -rf "${UTILTMPDIR}"
}

# download the latest release from github UNLESS
#   current dir-name = repo name (from git clone) OR
#   current dir-name = package DL name (from extracting tar or zip)
if [[ ! ("${CURRENTDIR}" =~ "${UTILTMPDIR}"*) && ! (("${CURRENTDIR}" =~ "${REPONAME}"*)) ]]; then

  # find latest repo package, download and un-tar it
  TMPDIR=${TMPDIR:-/tmp}
  cd "${TMPDIR}" || exit 1
  PKGDLURL=$(curl -s https://api.github.com/repos/${REPOACCT}/${REPONAME}/releases/latest | grep tarball_url | head -n 1 | cut -d '"' -f 4)
  curl -sL "$PKGDLURL" | tar zxf -

  # find the name of the dir extracted to, as it has the last commit # as a suffix
  UTILTMPDIR=$(ls -d -t ${REPOACCT}-${REPONAME}* | head -n 1)
  UTILTMPDIR=${UTILTMPDIR/%\//}
  cd "${UTILTMPDIR}" || exit 1
  CLEANUPREQ=true
fi

# determine destination
if [[ -w "/usr/local/bin" ]]; then
  BINDIR="/usr/local/bin"
  CMDPREFIX=""
  STREAMLINED=true
else
  echo -e "installer - ${REPORTPHRASE}\n"
  echo "Specify install directory (a,b or c):"
  echo -en "\t(a) '~/bin'    (b) '/usr/local/bin' as root    (c) abort : "
  read -r -n 1 SELECTION
  echo
  if [ "${SELECTION}" == "a" ] || [ "${SELECTION}" == "A" ]; then
    BINDIR="${HOME}/bin"
    CMDPREFIX=""
  elif [ "${SELECTION}" == "b" ] || [ "${SELECTION}" == "B" ]; then
    BINDIR="/usr/local/bin"
    CMDPREFIX="sudo "
  else
    [[ "${CLEANUPREQ}" ]] && cleanupDownload
    exit 0
  fi
fi

# install
mkdir -p "${BINDIR}"
${CMDPREFIX} cp -f utils/aws-info "${BINDIR}"
${CMDPREFIX} cp -f utils/aws-list "${BINDIR}"
${CMDPREFIX} cp -f utils/aws-ssh "${BINDIR}"
${CMDPREFIX} cp -f utils/aws-start "${BINDIR}"
${CMDPREFIX} cp -f utils/aws-stop "${BINDIR}"
${CMDPREFIX} cp -f utils/aws-quick-cli-init.sh "${BINDIR}"

if [[ "${CLEANUPREQ}" ]]; then
  cleanupDownload
fi

[[ ! "$STREAMLINED" ]] && echo
echo "${REPORTPHRASE} installed to ${BINDIR}"

exit 0
