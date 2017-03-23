#!/bin/bash

VERSION="0.9.3"
REPONAME="aws-quick-cli"
REPOURL="robertpeteuil/${REPONAME}/archive/"

# exit if AWS CLI utilities not present
if ! type "aws" &> /dev/null; then
  echo "Please install AWS-CLI utilities first"
  exit
fi

TMPDIR=${TMPDIR:-/tmp}
UTILTMPDIR=${TMPDIR}${REPONAME}-${VERSION}
PKGDLURL="https://github.com/${REPOURL}v${VERSION}.tar.gz"

cd "${TMPDIR}" || exit 1
curl -sL "$PKGDLURL" | tar zxf -
cd "${UTILTMPDIR}" || exit 1
make install
cd "${TMPDIR}" || exit 1
rm -rf "${UTILTMPDIR}"
