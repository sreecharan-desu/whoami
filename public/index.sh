#!/usr/bin/env bash

# Terminal Portfolio - Sreecharan Desu
# Rugged, no‑nonsense terminal showcase with a friendly tone

set -euo pipefail

# --- Configuration ---
TYPING_SPEED=0.009
SECTION_DELAY=0.4

# --- Terminal Dimensions ---
TERM_COLS=$(tput cols 2>/dev/null || echo 80)

# --- Color Setup using ANSI escapes ---
if [[ -t 1 ]] && command -v tput &>/dev/null; then
    BLUE=$'\e[1;34m'
    CYAN=$'\e[0;36m'
    PURPLE=$'\e[0;35m'
    GRAY=$'\e[0;37m'
    WHITE=$'\e[1;37m'
    GREEN=$'\e[0;32m'
    YELLOW=$'\e[1;33m'
    RED=$'\e[0;31m'
    NC=$'\e[0m'
    BOLD=$'\e[1m'
    DIM=$'\e[2m'
else
    BLUE='' CYAN='' PURPLE='' GRAY='' WHITE='' GREEN='' YELLOW='' RED='' NC='' BOLD='' DIM=''
fi

# --- Print helpers ---
centered_print_with_delay() {
    local text="$1" delay="${2:-$TYPING_SPEED}"
    local clean_text=$(echo "$text" | sed 's/\x1b\[[0-9;]*m//g')
    local padding=$(( (TERM_COLS - ${#clean_text}) / 2 ))
    [[ $padding -gt 0 ]] && printf '%*s' "$padding" ''
    
    for ((i = 0; i < ${#text}; i++)); do
        printf '%b' "${text:$i:1}"
        sleep "$delay"
    done
    printf '\n'
}

print_section_header() {
    local title="$1" color="$2"
    sleep "$SECTION_DELAY"
    centered_print_with_delay "${color}▶ ${WHITE}${BOLD}${title^^}${color} ◀${NC}"
}

# --- Main Presentation ---
clear

# Hide cursor for cleaner presentation
printf '\e[?25l'
trap 'printf "\e[?25h"' EXIT

printf '%b' "${WHITE}${BOLD}"
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
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

# --- Introduction ---
printf '\n'
centered_print_with_delay "${WHITE}Hey there! I'm Sreecharan, a guy who codes casually every day.${NC}"
centered_print_with_delay "${DIM}${GRAY}I'm always exploring new stacks and building things people love.${NC}"

# --- Current Work ---
printf '\n'
centered_print_with_delay "${DIM}${GRAY}Currently working on:${NC}"
centered_print_with_delay "${CYAN}- DevOps & Cloud systems${NC}"

# --- Portfolio Link ---
printf '\n'
centered_print_with_delay "${DIM}${GRAY}Take a look at my work:${NC}"
centered_print_with_delay "${WHITE}https://sreecharandesu.in${NC}"

# --- Menu & Interaction ---
printf '\n'
centered_print_with_delay "${CYAN}${NC} ${WHITE}${BOLD}Ready to connect?${NC} ${DIM}Let's chat!${NC} ${CYAN}${NC}"
printf '\n'
centered_print_with_delay "${WHITE}${BOLD}[Y]${NC} ${GREEN}Yes, let's talk!${NC}  ${WHITE}${BOLD}[N]${NC} ${GRAY}Maybe later${NC}"

# Stylized input prompt
printf '\n\e[?25h'
printf '%*s%b' $(( (TERM_COLS - 8) / 2 )) '' "${CYAN}${BOLD}❯${NC} ${WHITE}Choice${NC} ${CYAN}${BOLD}❯${NC} "
read -r -n 1 choice 

case "$choice" in
  [Yy] | '' )
    centered_print_with_delay "${GREEN}${BOLD}✓ Awesome! Connecting to SreeCharan${NC}"
    printf '\n'
    centered_print_with_delay "${CYAN}Opening WhatsApp${NC}"
    for i in {1..3}; do
        printf '%*s%b' $(( TERM_COLS / 2 - 1 )) '' "${DIM}."
        sleep 0.3
    done
    printf '\n\n'
    if command -v xdg-open &>/dev/null; then
        xdg-open "https://wa.me/+916300625861?text=Hi%20SreeCharan,%20I%27m%20interested%20in%20hiring%20you!" &>/dev/null
        centered_print_with_delay "${GREEN}${BOLD}✓ WhatsApp opened! Check your browser${NC}"
    elif command -v open &>/dev/null; then
        open "https://wa.me/+916300625861?text=Hi%20SreeCharan,%20I%27m%20interested%20in%20hiring%20you!" &>/dev/null
        centered_print_with_delay "${GREEN}${BOLD}✓ WhatsApp opened! Check your browser${NC}"
    elif command -v start &>/dev/null; then
        start "https://wa.me/+916300625861?text=Hi%20SreeCharan,%20I%27m%20interested%20in%20hiring%20you!" &>/dev/null
        centered_print_with_delay "${GREEN}${BOLD}✓ WhatsApp opened! Check your browser${NC}"
    else
        centered_print_with_delay "${YELLOW}${BOLD}📱 Click here: https://wa.me/+916300625861${NC}"
    fi
    ;;
  [Nn] )
    centered_print_with_delay "${BLUE}${BOLD}✓ No problem! Catch you on the flip side${NC}"
    centered_print_with_delay "${DIM}${GRAY}Feel free to check out my portfolio anytime${NC}"
    ;;
  * )
    centered_print_with_delay "${RED}${BOLD}⚠ Hmm, that's not Y or N. Try again!${NC}"
    centered_print_with_delay "${DIM}${GRAY}(Press Y for Yes or N for No)${NC}"
    ;;
esac

# --- Stylized Closing Message ---
printf '\n\n'
centered_print_with_delay "${WHITE}${BOLD}╔══════════════════════════════════════╗${NC}"
centered_print_with_delay "${WHITE}${BOLD}${NC}    ${CYAN}Thanks for visiting my CLI!${NC}    ${WHITE}${BOLD}${NC}"
centered_print_with_delay "${WHITE}${BOLD}╚══════════════════════════════════════╝${NC}"
printf '\n'
centered_print_with_delay "${DIM}${GRAY}💭 \"Building simple, useful things is my kind of fun.\"${NC}"
echo ""
echo ""
echo ""
# Show cursor again
printf '\e[?25h'