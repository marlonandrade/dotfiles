DULL=0
BRIGHT=1

FG_BLACK=30
FG_RED=31
FG_GREEN=32
FG_YELLOW=33
FG_BLUE=34
FG_VIOLET=35
FG_CYAN=36
FG_WHITE=37

FG_NULL=00

BG_BLACK=40
BG_RED=41
BG_GREEN=42
BG_YELLOW=43
BG_BLUE=44
BG_VIOLET=45
BG_CYAN=46
BG_WHITE=47

BG_NULL=00

##
# ANSI Escape Commands
##
ESC="\[\033"
END="\]"
NORMAL="$ESC[m$END"
RESET="$ESC[${DULL};${FG_WHITE};${BG_NULL}m$END"

BLACK="$ESC[${DULL};${FG_BLACK}m$END"
RED="$ESC[${DULL};${FG_RED}m$END"
GREEN="$ESC[${DULL};${FG_GREEN}m$END"
YELLOW="$ESC[${DULL};${FG_YELLOW}m$END"
BLUE="$ESC[${DULL};${FG_BLUE}m$END"
VIOLET="$ESC[${DULL};${FG_VIOLET}m$END"
CYAN="$ESC[${DULL};${FG_CYAN}m$END"
WHITE="$ESC[${DULL};${FG_WHITE}m$END"

# BRIGHT TEXT
BRIGHT_BLACK="$ESC[${BRIGHT};${FG_BLACK}m$END"
BRIGHT_RED="$ESC[${BRIGHT};${FG_RED}m$END"
BRIGHT_GREEN="$ESC[${BRIGHT};${FG_GREEN}m$END"
BRIGHT_YELLOW="$ESC[${BRIGHT};${FG_YELLOW}m$END"
BRIGHT_BLUE="$ESC[${BRIGHT};${FG_BLUE}m$END"
BRIGHT_VIOLET="$ESC[${BRIGHT};${FG_VIOLET}m$END"
BRIGHT_CYAN="$ESC[${BRIGHT};${FG_CYAN}m$END"
BRIGHT_WHITE="$ESC[${BRIGHT};${FG_WHITE}m$END"
