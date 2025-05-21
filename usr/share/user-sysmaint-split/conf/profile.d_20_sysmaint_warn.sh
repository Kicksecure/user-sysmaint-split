#!/bin/sh

## Copyright (C) 2024 - 2025 ENCRYPTED SUPPORT LLC <adrelanos@whonix.org>
## See the file COPYING for copying conditions.

## 'source' is a bashism.
. /usr/libexec/helper-scripts/get_colors.sh || true >/dev/null 2>/dev/null

if [ ! "$XDG_SESSION_TYPE" = "tty" ]; then
   true "$0: INFO: Not running inside tty. Stop."
   return 0
   exit 0
fi

if ! tty 2>/dev/null | grep -- "/dev/tty" >/dev/null 2>/dev/null ; then
   true "$0: INFO: Not running inside tty. Stop."
   return 0
   exit 0
fi

if [ "$(id -un 2>&1)" = 'sysmaint' ]; then
   msg="[${green}INFO${nocolor}] You are using the sysmaint account. This account has sudoers capabilities. Proceed with caution. See also: https://www.kicksecure.com/wiki/Sysmaint"
   msg_nocolor='[INFO] You are using the sysmaint account. This account has sudoers capabilities. Proceed with caution. See also: https://www.kicksecure.com/wiki/Sysmaint'
   ## 'echo -e' not supported by sh.
   if [ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ]; then
      echo -e "${msg}"
   else
      echo "${msg_nocolor}"
   fi
fi
