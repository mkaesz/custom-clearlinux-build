#!/bin/bash

# Server Post Install steps

set -ex

CHROOTPATH=$1
export HOOKDIR=$(dirname $0)

# Add issue
${HOOKDIR}/add-server-login-issue.sh ${CHROOTPATH}

# Add changes to PS1 to indicate live image by setting the hostname
echo "clr-server" > ${CHROOTPATH}/etc/hostname

# Add the user account for auto-login
echo "Creating user account clrlinux"
chroot $CHROOTPATH usermod -a -G wheelnopw clrlinux
chroot $CHROOTPATH usermod -u 1000 clrlinux
chroot $CHROOTPATH passwd -d clrlinux

chroot $CHROOTPATH systemd-machine-id-setup

exit 0

