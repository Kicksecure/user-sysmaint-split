#!/bin/sh --

## Copyright (C) 2025 - 2025 ENCRYPTED SUPPORT LLC <adrelanos@whonix.org>
## See the file COPYING for copying conditions.

qubes_version="$(cat /usr/share/qubes/marker-vm | grep -v '^#')"
if printf "%s\n" "${qubes_version}" | grep -q -e '^4.3' -e '^4.4' -e '^4.5' -e '^4.6' ; then
   qvm-features-request boot-mode.kernelopts.sysmaint='boot-role=sysmaint systemd.unit=sysmaint-boot.target'
   qvm-features-request boot-mode.name.sysmaint='PERSISTENT mode SYSMAINT'
   qvm-features-request boot-mode.active='sysmaint'
fi
