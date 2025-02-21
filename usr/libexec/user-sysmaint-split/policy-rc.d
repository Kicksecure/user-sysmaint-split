#!/bin/bash

## Copyright (C) 2025 - 2025 ENCRYPTED SUPPORT LLC <adrelanos@whonix.org>
## See the file COPYING for copying conditions.

kernel_cmdline="$(cat /proc/cmdline)"

if [[ "${kernel_cmdline}" =~ 'boot-role=sysmaint' ]]; then
  unit_name=""
  action_list=()
  if [ "$1" == "--quiet" ]; then
    shift
  fi
  if [ "$1" == "--list" ]; then
    exit 0
  fi
  unit_name="$1"
  IFS=' ' read -ra action_list <<< "$2"

  for action in "${action_list[@]}"; do
    case "${action}" in
      stop|force-stop|restart)
        if [ "${action}" = 'restart' ]; then
          if [ "$(systemctl is-active "${unit_name}")" != 'active' ]; then
            exit 101
          fi
        fi
        ;;
      *)
        exit 101
        ;;
    esac
  done
fi
