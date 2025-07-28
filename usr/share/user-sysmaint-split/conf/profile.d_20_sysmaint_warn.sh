#!/bin/sh

## Copyright (C) 2024 - 2025 ENCRYPTED SUPPORT LLC <adrelanos@whonix.org>
## See the file COPYING for copying conditions.

## This script gets `source`ed.
## Most likely by 'sh'.
##
## Using both 'return 0' and 'exit 0' to support both, `source`ing as well as
## executing this script.

case "$-" in
   *i*)
      true "INFO: Interactive shell. Continuing..."
      ;;
   *)
      true "INFO: Non-interactive shell. Stop."
      return 0 2>/dev/null
      exit 0
      ;;
esac

if [ ! "$XDG_SESSION_TYPE" = "tty" ]; then
   true "$0: INFO: Not running inside tty. Stop."
   return 0 2>/dev/null
   exit 0
fi

if ! tty 2>/dev/null | grep -- "/dev/tty" >/dev/null 2>/dev/null ; then
   true "$0: INFO: Not running inside tty. Stop."
   return 0 2>/dev/null
   exit 0
fi

if [ "$(id -un 2>&1)" = 'sysmaint' ]; then
   if [ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ]; then
      ## 'source' is a bashism.
      ## 'get_colors.sh' is incompatible with 'sh'.
      ## printf: Illegal option -v
      source /usr/libexec/helper-scripts/get_colors.sh || true >/dev/null 2>/dev/null
      msg="[${green}INFO${nocolor}] You are using the sysmaint account. This account has sudoers capabilities. Proceed with caution. See also: https://www.kicksecure.com/wiki/Sysmaint"
      echo -e "${msg}"
   else
      ## 'echo -e' not supported by sh.
      msg_nocolor='[INFO] You are using the sysmaint account. This account has sudoers capabilities. Proceed with caution. See also: https://www.kicksecure.com/wiki/Sysmaint'
      echo "${msg_nocolor}"
   fi
fi
