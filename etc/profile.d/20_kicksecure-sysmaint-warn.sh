#!/bin/sh

## Copyright (C) 2024 - 2024 ENCRYPTED SUPPORT LP <adrelanos@whonix.org>
## See the file COPYING for copying conditions.

source /usr/libexec/helper-scripts/get_colors.sh

if [ "$(id -un)" = 'sysmaint' ]; then
  echo -e "${green}INFO${nocolor}] You are using the sysmaint account. This account has sudoers capabilities. Proceed with caution."
fi
