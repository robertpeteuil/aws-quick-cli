#!/bin/bash

REPOACCT="robertpeteuil"
REPONAME="aws-quick-cli"

# exit if AWS CLI utilities not present
if ! type "aws" &> /dev/null; then
  echo "Please install AWS-CLI utilities first"
  exit
fi

# switch to temp dir
TMPDIR=${TMPDIR:-/tmp}
cd "${TMPDIR}" || exit 1

# find latest repo package, download and un-tar it
PKGDLURL=$(curl -s https://api.github.com/repos/${REPOACCT}/${REPONAME}/releases/latest | grep tarball_url | head -n 1 | cut -d '"' -f 4)
curl -sL "$PKGDLURL" | tar zxf -

# find the name of the dir extracted to, as it has the last commit # as a suffix
UTILTMPDIR=$(ls -d -t ${REPOACCT}-${REPONAME}* | head -n 1)
UTILTMPDIR=${UTILTMPDIR//\//}

# switch to extraction dir, install, then remove extraction dir & files
cd "${UTILTMPDIR}" || exit 1
make install
cd "${TMPDIR}" || exit 1
rm -rf "${UTILTMPDIR}"
