#!/bin/sh --

## Copyright (C) 2025 - 2025 ENCRYPTED SUPPORT LLC <adrelanos@whonix.org>
## See the file COPYING for copying conditions.

qvm-features-request boot-mode.kernelopts.sysmaint='boot-role=sysmaint systemd.unit=sysmaint-boot.target'
qvm-features-request boot-mode.name.sysmaint='PERSISTENT mode SYSMAINT'
qvm-features-request boot-mode.active='sysmaint'
