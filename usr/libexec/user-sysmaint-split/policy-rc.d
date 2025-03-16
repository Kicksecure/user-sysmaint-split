#!/bin/bash

## Copyright (C) 2025 - 2025 ENCRYPTED SUPPORT LLC <adrelanos@whonix.org>
## See the file COPYING for copying conditions.

## systemd actions:
## - 'stop' and 'force-stop' are always permitted.
## - 'restart' is only allowed if the systemd unit is already running (active).
## - 'start' is always denied.
## - "other" actions (if any) are always denied.

kernel_cmdline="$(cat -- /proc/cmdline)"

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
  IFS=' ' read -r -a action_list <<< "$2"

  for action in "${action_list[@]}"; do
    case "${action}" in
      stop|force-stop|restart)
        ## action stop: permit
        ## action force-stop: permit
        ## action restart: if...
        if [ "${action}" = 'restart' ]; then
          if [ "$(systemctl is-active -- "${unit_name}")" != 'active' ]; then
            ## action restart: If the systemd unit is NOT already running (active), deny (re)start.
            exit 101
          fi
          ## action restart: If the systemd unit IS already running (active), permit (re)start.
        fi
        ;;
      *)
        ## action start: deny
        ## action other (if any): deny
        exit 101
        ;;
    esac
  done
fi
