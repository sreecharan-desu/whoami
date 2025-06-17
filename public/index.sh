#!/usr/bin/env bash

# ──────────────────────────────────────────────────────
# Terminal Portfolio — Sreecharan Desu
# Clean, minimal, hacker-friendly CLI inspired by Vite, Turborepo
# ──────────────────────────────────────────────────────

set -euo pipefail

# --- Config ---
TYPING_SPEED=0.009
SECTION_DELAY=0.4
TERM_COLS=$(tput cols 2>/dev/null || echo 80)

# --- Colors ---
if [[ -t 1 ]] && command -v tput &>/dev/null; then
  BLUE=$'\e[1;34m' CYAN=$'\e[0;36m' PURPLE=$'\e[0;35m'
  GRAY=$'\e[0;37m' WHITE=$'\e[1;37m' GREEN=$'\e[0;32m'
  YELLOW=$'\e[1;33m' RED=$'\e[0;31m' NC=$'\e[0m'
  BOLD=$'\e[1m' DIM=$'\e[2m'
else
  BLUE='' CYAN='' PURPLE='' GRAY='' WHITE='' GREEN=''
  YELLOW='' RED='' NC='' BOLD='' DIM=''
fi

# --- Helpers ---
centered_print_with_delay() {
  local text="$1" delay="${2:-$TYPING_SPEED}"
  local clean_text
  clean_text=$(echo "$text" | sed 's/\x1b\[[0-9;]*m//g')
  local padding=$(( (TERM_COLS - ${#clean_text}) / 2 ))
  [[ $padding -gt 0 ]] && printf '%*s' "$padding" ''
  for ((i = 0; i < ${#text}; i++)); do
    printf '%b' "${text:$i:1}"
    sleep "$delay"
  done
  printf '\n'
}

# --- Start ---
clear
printf '\e[?25l'
trap 'printf "\e[?25h"' EXIT

# --- Banner ---
printf '%b' "${WHITE}${BOLD}\n\n\n\n\n\n"
echo "        ███████╗██████╗ ███████╗███████╗ ██████╗██╗  ██╗ █████╗ ██████╗  █████╗ ███╗   ██╗    ██████╗ ███████╗███████╗██╗   ██╗"
sleep 0.2
echo "        ██╔════╝██╔══██╗██╔════╝██╔════╝██╔════╝██║  ██║██╔══██╗██╔══██╗██╔══██╗████╗  ██║    ██╔══██╗██╔════╝██╔════╝██║   ██║"
sleep 0.2
echo "        ███████╗██████╔╝█████╗  █████╗  ██║     ███████║███████║██████╔╝███████║██╔██╗ ██║    ██║  ██║█████╗  ███████╗██║   ██║"
sleep 0.2
echo "        ╚════██║██╔══██╗██╔══╝  ██╔══╝  ██║     ██╔══██║██╔══██║██╔══██╗██╔══██║██║╚██╗██║    ██║  ██║██╔══╝  ╚════██║██║   ██║"
sleep 0.2
echo "        ███████║██║  ██║███████╗███████╗╚██████╗██║  ██║██║  ██║██║  ██║██║  ██║██║ ╚████║    ██████╔╝███████╗███████║╚██████╔╝"
sleep 0.2
echo "        ╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝    ╚═════╝ ╚══════╝╚══════╝ ╚═════╝"
printf '%b' "${NC}"

# --- Intro ---
printf '\n'
centered_print_with_delay "${WHITE}Hey there! I'm Sreecharan, a guy who codes casually every day.${NC}"
centered_print_with_delay "${DIM}${GRAY}I'm always exploring new stacks and building things people love.${NC}"

# --- Currently Working On ---
printf '\n'
centered_print_with_delay "${DIM}${GRAY}Currently working on:${NC}"
centered_print_with_delay "${CYAN}- DevOps & Cloud systems${NC}"

# --- Portfolio Link ---
printf '\n'
centered_print_with_delay "${DIM}${GRAY}Take a look at my work:${NC}"
centered_print_with_delay "${WHITE}https://sreecharandesu.in${NC}"

# --- Let's Chat ---
printf '\n'
centered_print_with_delay "${CYAN}${BOLD}Wanna talk ?${NC}"
centered_print_with_delay "${WHITE}Let's talk 👉 https://chat.sreecharandesu.in${NC}"

# --- Closing ---
printf '\n\n'
centered_print_with_delay "${WHITE}${BOLD}╔══════════════════════════════════════╗${NC}"
centered_print_with_delay "      ${CYAN}${BOLD}Thanks for visiting my CLI!${NC}"
centered_print_with_delay "${WHITE}${BOLD}╚══════════════════════════════════════╝${NC}"
printf '\n'
centered_print_with_delay "${DIM}${GRAY}💭 \"Building simple, useful things is my kind of fun.\"${NC}"
printf '\n\n\n'
printf '\e[?25h'
