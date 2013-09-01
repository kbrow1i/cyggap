#!/bin/sh
#
# Script borrowed from Debian.  Thanks to the Debian packagers.

set -e

GAP="/usr/bin/gap"

if ! test -x "$GAP"; then
    exit 0;
fi

WORKSPACE=$HOME/.gap/workspace

case $1 in
delete) echo -n "Deleting GAP workspace $WORKSPACE..."
    rm -f $WORKSPACE
    echo "done.";;
''|update) echo -n "Updating GAP workspace $WORKSPACE..."
    rm -f $WORKSPACE
    mkdir -p `dirname $WORKSPACE`
    echo 'SaveWorkspace("'$WORKSPACE'");' | $GAP -q -r -R >/dev/null
    echo "done.";;
*)
    echo "$0 update"
    echo "  Update GAP workspace in $WORKSPACE.gz"
    echo
    echo "$0 delete"
    echo "  Delete GAP workspace in $WORKSPACE.gz"
    ;;
esac
