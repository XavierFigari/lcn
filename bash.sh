#!/usr/bin/env bash

# Include with:
# . /PATH/to/bash.sh

set -o errexit
set -o nounset
set -o pipefail
set -o posix

typeset -r BLUE=6
typeset -r RED=1
typeset -r YELLOW=3
typeset -r GREEN=2
typeset -rx TERM=xterm-256color

echo_red() { echo -e "$(tput setaf $RED)$*$(tput sgr0)"; }
echo_yellow() { echo -e "$(tput setaf $YELLOW)$*$(tput sgr0)"; }
echo_blue() { echo -e "$(tput setaf $BLUE)$*$(tput sgr0)"; }
echo_green() { echo -e "$(tput setaf $GREEN)$*$(tput sgr0)"; }

err_notify() {
  echo_red >&2 "ERROR: $*"
  command -v notify-send >/dev/null && notify-send -u critical "ERROR: $*"
  exit 1
}

notify() {
  echo_blue >&2 "$*"
  command -v notify-send >/dev/null && notify-send -u normal "$*"
}

err() {
  echo_red >&2 "ERROR: $*"
  exit 1
}
