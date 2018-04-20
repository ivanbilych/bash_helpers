#!/bin/bash

# Different helpers for text output manipulations

text_color_clear="00"

# Text attributes
text_attribute_normal="0"
text_attribute_bold="1"
text_attribute_dim="2"
text_attribute_underline="4"
text_attribute_blink="5"
text_attribute_reversed="7"
text_attribute_hidden="8"

# Text color
text_color_black="30"
text_color_blue="34"
text_color_cyan="36"
text_color_green="32"
text_color_purple="35"
text_color_red="31"
text_color_white="37"
text_color_yellow="33"

# Text background color
background_color_black="40"
background_color_blue="44"
background_color_cyan="46"
background_color_green="42"
background_color_purple="45"
background_color_red="41"
background_color_white="47"
background_color_yellow="43"

style() {
    echo "\e[${2};${1}m"
}

# Set of different text styles
text_normal="$(style ${text_color_clear} ${text_attribute_normal})"
text_black="$(style ${text_color_black} ${text_attribute_normal})"
text_black_b="$(style ${text_color_black} ${text_attribute_bold})"
text_blue="$(style ${text_color_blue} ${text_attribute_normal})"
text_blue_b="$(style ${text_color_blue} ${text_attribute_bold})"
text_cyan="$(style ${text_color_cyan} ${text_attribute_normal})"
text_cyan_b="$(style ${text_color_cyan} ${text_attribute_bold})"
text_green="$(style ${text_color_green} ${text_attribute_normal})"
text_green_b="$(style ${text_color_green} ${text_attribute_bold})"
text_purple="$(style ${text_color_purple} ${text_attribute_normal})"
text_purple_b="$(style ${text_color_purple} ${text_attribute_bold})"
text_red="$(style ${text_color_red} ${text_attribute_normal})"
text_red_b="$(style ${text_color_red} ${text_attribute_bold})"
text_white="$(style ${text_color_white} ${text_attribute_normal})"
text_white_b="$(style ${text_color_white} ${text_attribute_bold})"
text_yellow="$(style ${text_color_yellow} ${text_attribute_normal})"
text_yellow_b="$(style ${text_color_yellow} ${text_attribute_bold})"

# Set of different background styles
background_black="$(style ${background_color_black} ${text_attribute_normal})"
background_blue="$(style ${background_color_blue} ${text_attribute_normal})"
background_cyan="$(style ${background_color_cyan} ${text_attribute_normal})"
background_green="$(style ${background_color_green} ${text_attribute_normal})"
background_purple="$(style ${background_color_purple} ${text_attribute_normal})"
background_red="$(style ${background_color_red} ${text_attribute_normal})"
background_white="$(style ${background_color_white} ${text_attribute_normal})"
background_yellow="$(style ${background_color_yellow} ${text_attribute_normal})"

# Test
# echo -e "${text_black}This is a test message${text_normal}"
# echo -e "${text_black_b}This is a test message${text_normal}"
# echo -e "${text_blue}This is a test message${text_normal}"
# echo -e "${text_blue_b}This is a test message${text_normal}"
# echo -e "${text_cyan}This is a test message${text_normal}"
# echo -e "${text_cyan_b}This is a test message${text_normal}"
# echo -e "${text_green}This is a test message${text_normal}"
# echo -e "${text_green_b}This is a test message${text_normal}"
# echo -e "${text_purple}This is a test message${text_normal}"
# echo -e "${text_purple_b}This is a test message${text_normal}"
# echo -e "${text_red}This is a test message${text_normal}"
# echo -e "${text_red_b}This is a test message${text_normal}"
# echo -e "${text_white}This is a test message${text_normal}"
# echo -e "${text_white_b}This is a test message${text_normal}"
# echo -e "${text_yellow}This is a test message${text_normal}"
# echo -e "${text_yellow_b}This is a test message${text_normal}"

# Functions

print_debug() {
    echo -e "${text_white_b}DEBUG: ${text_white}${1}${text_normal}"
}

print_info() {
    echo -e "${text_white_b}INFO: ${text_white}${1}${text_normal}"
}

print_warning() {
    echo -e "${text_yellow_b}WARNING: ${text_yellow}${1}${text_normal}"
}

print_error() {
    echo -e "${text_red_b}ERROR: ${text_red}${1}${text_normal}"
}

print_title() {
    echo -e "${text_purple_b}### ${text_purple}${1}${text_purple_b} ###${text_normal}"
}

print_success() {
    echo -e "${text_green_b}### ${text_green}${1}${text_green_b} ###${text_normal}"
}

print_failure() {
    echo -e "${text_red_b}### ${text_red}${1}${text_red_b} ###${text_normal}"
}

LINES=$(tput lines)
COLUMNS=$(tput cols)

print_ok() {
    local char_shift=$(( ${COLUMNS}-${#1}%${COLUMNS}-8 ))

    printf "${1}%${char_shift}s${text_white_b}%s${text_green_b}%s${text_white_b}%s${text_normal}\n" "" "[" "OK" "]"
}

print_fail() {
    local char_shift=$(( ${COLUMNS}-${#1}%${COLUMNS}-8 ))

    printf "${1}%${char_shift}s${text_white_b}%s${text_red_b}%s${text_white_b}%s${text_normal}\n" "" "[" "FAIL" "]"
}

print_unknown() {
    local char_shift=$(( ${COLUMNS}-${#1}%${COLUMNS}-8 ))

    printf "${1}%${char_shift}s${text_white_b}%s${text_blue_b}%s${text_white_b}%s${text_normal}\n" "" "[" "???" "]"
}

dots_repeater() {
    dots=$(printf "%-${1}s")
    echo -n "${dots// /.}"
}

print_ok_dots() {
    local char_shift=$(( ${COLUMNS}-${#1}%${COLUMNS}-8 ))

    echo -n ${1}
    dots_repeater ${char_shift}
    echo -e "${text_white_b}[${text_green_b}OK${text_white_b}]${text_normal}"
}

print_fail_dots() {
    local char_shift=$(( ${COLUMNS}-${#1}%${COLUMNS}-8 ))

    echo -n ${1}
    dots_repeater ${char_shift}
    echo -e "${text_white_b}[${text_red_b}FAIL${text_white_b}]${text_normal}"
}

print_unknown_dots() {
    local char_shift=$(( ${COLUMNS}-${#1}%${COLUMNS}-8 ))

    echo -n ${1}
    dots_repeater ${char_shift}
    echo -e "${text_white_b}[${text_blue_b}???${text_white_b}]${text_normal}"
}

# Test
# print_debug "This is a debug message"
# print_info "This is a info message"
# print_warning "This is a warning message"
# print_error "This is a error message"
# print_title "This is a title message"
# print_success "This is a success message"
# print_failure "This is a failure message"
# print_ok "This is a ok message"
# print_fail "This is a fail message"
# print_unknown "This is a unknown message"
# print_ok_dots "This is a ok dots message"
# print_fail_dots "This is a fail dots message"
# print_unknown_dots "This is a unknown dots message"
