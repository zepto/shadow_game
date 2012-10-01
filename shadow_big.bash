#!/bin/bash

# A game.  Eat all the *'s to move to the next level
# but don't get eaten by the badguy!
# Copyright (C) 2009  Josiah
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

level1=("11111111111111111111111111111111111111111111111111111111111111111111111111111111" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000P00000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "11111111111111111111111111111111111111110111111111111111111111111111111111111111" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000B00000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "11111111111111111111111111111111111111111111111111111111111111111111111111111111"
        "G*C033"   # wall and goody character
        )

level2=("11111111111111111111111111111111111111111111111111111111111111111111111111111111" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000P00000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000010000000000000000000000000000000000000000000000000000000100000000001" 
        "10000000000010000000000000000000000000000000000000000000000000000000100000000001" 
        "10000000000010000000000000000000000000000000000000000000000000000000100000000001" 
        "10000000000010000000000000000000000000000000000000000000000000000000100000000001" 
        "10000000000010000111111111111111111111111111111111111111111111110000100000000001" 
        "10000000000010000000000000000000000000000000000000000000000000000000100000000001" 
        "10000000000010000000000000000000000000000000000000000000000000000000100000000001" 
        "10000000000010000000000000000000000000000000000000000000000000000000100000000001" 
        "10000000000010000000000B00000000000000000000000000000000000000000000100000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "1000000000000000000000000000000000000000000000000000B000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "11111111111111111111111111111111111111111111111111111111111111111111111111111111"
        "W#G*C032"   # wall and goody character
        )

level3=("11111111111111111111111111111111111111111111111111111111111111111111111111111111" 
        "10000001000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000001000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000001000000000000000000000000000000000100000000000000000000000000000000000001" 
        "100000010000000000000000000000000000000001000B0000000000000000000000000000000001" 
        "10000001000000000000000000000000000000000100000000000000000000000000000000000001" 
        "10000001000000000000000000000000000000000100000000000000000000000000000000000001" 
        "10000001000000000000000000000000000000000100000000000000000000000000000000000001" 
        "10000001000000P00111111111111111111111100111111111111111111000000000000000000001" 
        "10000000000000000000100000000000000000000100000000000000000000000000000000000001" 
        "10000000000000000000100000000000B00000000100000000000000000000000000000000000001" 
        "10000000000000100000100000000000000000000100000000000000000000000000000000000001" 
        "10000000000000100000100000000000000000000100000000000000000000000000000000000001" 
        "10000000000000111111111111111111111111111111111111111111111000010000000000000001" 
        "10000000000000100000000000000000000000000000000000000000000000010000000000000001" 
        "10000000000000100000000000000000000000000000000000000000000000010000000000000001" 
        "100000000000001000000000000000000000000000000B0000000000000000010000000000000001" 
        "10000000000000100000000000000000000000000000000000000000000000010000000000000001" 
        "10000000000000100000111111111111111111111111111111111111111111110000000000000001" 
        "10000000000000100000000000000000000000000000000000000000000000010000000000000001" 
        "10000000000000100000000000000000000000000000000000000000000000010000000000000001" 
        "10000000000000100000000000000000000000000000000000000000000000010000000000000001" 
        "10000000000000100000000000000000000000000000000000000000000000010000000000000001" 
        "10000000000000100000000000000000000000000000000000000000000000000000000000000001" 
        "11111111111111111111111111111111111111111111111111111111111111111111111111111111"
        "W#G*C034"   # wall and goody character and color
        )

level4=("1111" 
        "10P1"
        "100111111111111111111111111111111111"
        "1000000000000000000000000000100000B1"
        "100000000000000000001000000010000001"
        "100000000000000000001000000000000001"
        "111111111111111111111111111111111111"
        )

level5=("1111" 
        "10P1"
        "10011111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"
        "10011111111111111111100000000000000000000000000000000000000000011111111111B11111111111111111111111111000000000B00000000000000000000000000000000000000000000000001"
        "10011111111111111111100000000000000000000000000000000000000000011111111111011111111111111111111111111000000000000000000000000000000000000000000000000000000000001"
        "10000000000000000000000000000001111111111111110000000000000000000000000000000000000000000000000000001110011111111111111111111111111111111111111111111111111111111"
        "10000000000000000000000000000001111111111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001"
        "10000000000000000000000000000001111111111111110000000000000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111110011"
        "10011111111111111111100000000000000000000000000000000000000000011111111111111111111111111101111111111000000000000000000000000000000000000000000000000000000000001"
        "100111111111111111111000000000000000000000000000000000000000000111111111111111111111111111B111111111100000000000000000000000000000000000B000000000000000000000001"
        "11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"
        )



# Global variables
eval $(resize)
if [[ $LINES -lt 25 || $COLUMNS -lt 80 ]]
then
    echo "Requires atleast 80x25"
    exit
fi
Rows=$LINES             # level rows
Columns=$COLUMNS        # level columns
curlvl=1                # current level
numlvls=10              # number of levels
greq=10                 # goodies required
lastlvl=${!level@}      # last level
maxlvls=${lastlvl: -1}  # maximum numbers of levels
draw_mode="buffered"    # draw mode of level

lvl=()                  # level array
scr_height=$Rows        # screen height
scr_width=$Columns      # screen width

esc=`printf "\e"`   # ESC

pch="<-"            # player animation
pchc=0              # animation counter
pchlen=1 #${#pch}   # player length
pcol=94             # player color

bch="Oo~o"          # badguy animation
bchc=0              # animation counter
bchlen=1 #${#bch}   # badguy length
bspeed=200          # badguy speed
btimer=0            # badguy speed timer
bc=0        # badguy counter
cb=0        # current badguy
obc=        # old badguy counter
bx=()       # badguy x array
by=()       # badguy y array
bcol=91     # badguy color

cht=0       # animation timer

gcount=0    # goody counter
gcol=35     # goodie color
gch="*"     # default goodie character

lheight=$Rows
lwidth=$Columns

invincible=0    # not invincible

# Initialize screen and input
function init ()
{
    # Exit on signals 0, 1, 2, and 3
    trap exitit 0 1 2 3

    RANDOM=`date +%s`   # seed random number generator

    clear   # clear screen

    stty -icanon time 0 min 0 -echo     # do not wait for key press and don't echo
    printf "\e[?25l"    # hide cursor
}

# Clean up screen at exit
function exitit ()
{
    #[[ $? -eq 3 ]] && printf "Hello, World\n"
    printf "\e[?25h\e[m"    # show cursor and reset colors
    stty icanon echo        # turn echo backon and wait for keys
}

# Player was eaten up
function youloose ()
{
    exitit
    printf "Gotcha!\n"
    exit
}

# Player finished all the levels
function youwin ()
{
    exitit
    printf "You Win!\n"
    exit
}

# Clear character
function clrpos ()
{
    local x=$1
    local y=$2
    local len=$3

    # Move cursor to row y column x and prints a space len characters long
    printf "\e[${y};${x}H%-${len}s"
}

# Get element from level array
function getelem ()
{
    local x=$1
    local y=$2

    # Print character 'x' in element 'y' of 'lvl array
    printf "${lvl[y-1]:x-1:1}"
}

# Set element in level array
function setelem ()
{
    local x=$1
    local y=$2
    [[ $y -le 0 ]] && return    # return if y is not in range

    # Set character 'x' in element 'y' of 'lvl' array
    lvl[$y-1]=${lvl[y-1]:0:x-1}$3${lvl[y-1]:x}
}

# Load level
function load_lvl()
{
    bspeed=200      # reset badguy speed
    btimer=0        # reset badguy timer
    gcount=0        # reset goody counter
    bc=0            # reset badguy counter
    cb=0            # reset current badguy
    drawlvl $curlvl $draw_mode # draw new level
    placegoodie
}

# Draw level
function drawlvl ()
{
    local i=0       # local index
    local t=0       # local temp
    local rnum=0    # local random number
    local ltemp=()  # local temp level
    local templev="level${1}[*]:-()"    # level string
    local wall_col= # wall_col = null
    local wall=     # wall = null
    local back_col=

    local pp=0

    # Reset badguy count
    bc=0
    obc=

    # Set level to current level
    lvl=(${!templev})

    clear           # clear screen

    # Get wall and goody chars and wall color
    lheight=$((${#lvl[@]}-1))
    if [[ $lheight -le 0 ]]
    then
        lheight=$Rows
    else
        for ((i=0; i<=${#lvl[lheight]}; i++))
        do
            case ${lvl[lheight]:i:1} in
                # Wall char
                "W") wall="${lvl[lheight]:$((++i)):1}" ;;   
                # Goody char
                "G") gch="${lvl[lheight]:$((++i)):1}" ;;
                # Wall color
                "C") wall_col=${lvl[lheight]:$((++i)):3}; ((i+=2)) ;;
                # Back color
                "S") back_col=${lvl[lheight]:$((++i)):3}; ((i+=2)) ;;
                # Not characters so break out of loop
                "1" | "0") ((lheight++)); break ;;
            esac
        done
        # Set scr_height to level height if it is bigger
        #[[ $lheight -gt $scr_height ]] && scr_height=$lheight
    fi
    
    # Set defaults
    [[ -z $wall ]] && wall="\040"          # if no wall default is '#'
    [[ -z $wall_col ]] && wall_col="032"   # if no color default is 32
    [[ -z $back_col ]] && back_col="009"   # if no color default is 32

    # Print 'building level' message
    [[ -n $2 ]] && printf "\e[$((Rows/2));$(((Columns/2)-20))H\e[34mBuilding level."

    local bnum=$(echo "obase=2;print $((400 - $1))" | bc -ql)
    local bnumlen=$((${#bnum} - 1))

    # Check which drawing method should be used
    if [[ $2 != "drawother" || $1 -gt $maxlvls ]]; then

        # Main level drawing loop
        for ((y=1; y<=lheight; y++))
        do

            lwidth=${#lvl[y-1]}                     # width of current line
            [[ $lwidth -eq 0 ]] && lwidth=$Columns  # if empty set to columns

            # Set scr_width to longest line
            [[ $lwidth -gt $scr_width ]] && scr_width=$lwidth

            for ((x=1; x<=lwidth; x++))
            do
                # Generate Random level
                if [[ $1 -gt $maxlvls ]]
                then
                    rnum=$((RANDOM % (400 - $1)))
                    t=$((rnum >> bnumlen))  # take last bit of random number
                    #rnum=$((RANDOM % 100))  # random number from 0-100
                    #if [[ $rnum -lt $((60+$1)) ]] # make levels progressively harder
                    #then
                        #t=0                 # clear area of level
                    #else
                        #t=1                 # wall
                    #fi

                    # Make a wall around random level
                    #[[ $x -eq 1 || $y -eq 1 || $x -eq $Columns || $y -eq Rows ]] && t=1
                    
                    
                    rnum=$((RANDOM % 1000))
                    if [[ $((rnum >> (RANDOM % ((RANDOM % 8) + 1)))) -eq 1 && $pp -ne 1 ]]
                    then
                        t="P"
                        pp=1
                    fi

                    if [[ $((rnum >> (RANDOM % ((RANDOM % 8) + 1)))) -eq 0 ]]
                    then
                        if [[ $y -ge 20 ]]
                        then
                            if [[ $bc -le $(($1 / 2)) ]]
                            then
                                t="B"
                            fi
                        fi
                    fi
                    #if [[ $x -eq 10 && $y -eq 10 ]] # players starting position
                    #then
                        #t="P"               
                    #elif [[ $x -eq 20 && $y -eq 20 ]] # badguys starting position
                    #then
                        #t="B"
                    #fi

                    lvl[y-1]=${lvl[y-1]}$t  # append character to current line
                fi
                ######################

                # Draw level
                case ${lvl[y-1]:x-1:1} in
                    # Draw wall if unbuffered
                    1) [[ -z $2 ]] && printf "\e[${wall_col}m\e[${y};${x}H${wall}\e[m" ;;
                    # Set player starting position
                    "P") 
                        px=$x
                        py=$y
                        ;;
                    # set badguy starting position
                    "B") 
                        bx[$bc]=$x
                        by[$bc]=$y
                        bspeed=200
                        ((bc++)) 
                        ;;
                esac
            done

            # Draw .'s while generating level
            [[ -n $2 ]] && printf "."
        done
    fi

    # Draw level depending on mode
    if [[ $2 == "buffered" ]]   # draw buffered level
    then
        clear

        # Set background color if wall is a space '\040'
        [[ $wall == "\040" ]] && back_col="$((${wall_col:1:1}+1))${wall_col: -1}" #&& wall=" "

        ltemp=(${lvl[@]//[0PB]/"\040"})                                 # replace 0's with space
        ltemp=(${ltemp[@]//1/"\e[${wall_col};${back_col}m${wall}\e[m"}) # replace 1's with wall

        # Draw level
        for ((y=1; y<=lheight; y++))
        do
            printf "\e[${y};0H${ltemp[y-1]}\e[m" # draw walls
        done

        #printf "${lvl[*]}" | sed -n -e "s/.[GCSW].*$//g; s/^[[:space:]]*//; s/[[:space:]]/\n/g; s/[0PB]/ /g; s/1/[${wall_col};${back_col}m${wall}[m/g; p"

        #printf "${lvl[*]}" | gawk '
                #BEGIN {
                    #RS=" "
                #}  
                #/^[^GCSW]/ {
                    #if (NR != 1) { 
                        #printf "\n" 
                    #}
                    #t = gensub(/[[:space:]]/, "\n", "g", $0)
                    #t = gensub(/[0PB]/, " ", "g", t)
                    #t= gensub(/1/, "['"${wall_col};${back_col}m${wall}"'[m", "g", t)
                    #printf "%s", t
                #}' #sed -n -e "s/^[[:space:]]*//; s/[[:space:]]/\n/g; s/[0PB]/ /g; s/1/[${wall_col};${back_col}m [m/g; p"
        #printf "${lvl[*]}" | sed -n -e 's/[[:space:]]/\n/gp'| sed -n -e "$ !{H};  $ {H; x; s/.[GCSW].*$//; s/^[[:cntrl:]]//; s/[0PB]/ /g; s/1/[${wall_col};${back_col}m${wall}[m/g; p}"

        #exit

    elif [[ $2 == "drawother" ]]    # draw maybe a little faster
    then
        clear

        # Set background color if wall is a space '\040'
        [[ $wall == "\040" ]] && back_col="$((${wall_col:1:1}+1))${wall_col: -1}"

        ltemp=(${lvl[@]//[0PB]/"\040"})                                 # replace 0's with space
        ltemp=(${ltemp[@]//1/"\e[${wall_col};${back_col}m${wall}\e[m"}) # replace 1's with wall
        #ltemp=(${lvl[@]//1/$wall})          # replace 1's with wall
        #ltemp=(${ltemp[@]//[0PB]/"\040"})   # replace 0's with space

        # Draw Level
        for ((y=1; y<=lheight; y++)) # in {1..25}
        do
            # Only find positions if it is a random level
            if [[ $1 -le $maxlvls ]]
            then
                # Set scr_width to longest line
                [[ ${#lvl[y-1]} -gt $scr_width ]] && scr_width=${#lvl[y-1]}

                # Find players position
                #t_x=$(expr index ${lvl[y-1]} P)     # get index of player
                t_x=$(echo ${lvl[y-1]} | gawk '{print index($0, "P")}')
                if [[ $t_x -ne 0 ]]
                then
                    px=$t_x     # set player start if found
                    py=$y
                fi
                t_num=1

                # Find and set badguy start
                for i in $(echo ${lvl[y-1]} | gawk 'BEGIN { FS = "B" } { for (i = 1; i < NF; i++) { x = (length($i)+1)+x; printf "%d ", x } }')
                do
                    bx[bc]=$i
                    by[bc]=$y
                    ((bc++))
                done
                #while [[ $t_num -ne 0 && $t_x -le ${#lvl[y-1]} ]]
                #do
                    #t_num=$(expr index ${lvl[y-1]:t_x} B)   # get index of badguy
                    #[[ $t_num -eq 0 ]] && break     # break if not found
                    #t_x=$((t_x+=t_num))             # add index to current index
                    #bx[bc]=$((t_x))
                    #by[bc]=$y
                    #((bc++))        # increment badguy counter
                #done
            fi

            # Draw walls
            #printf "\e[${wall_col}m\e[${y};0H${ltemp[y-1]}\e[m"
            printf "\e[${y};0H${ltemp[y-1]}\e[m" # draw walls
        done
        bspeed=200
    fi
}

# Place goody
function placegoodie ()
{
    local gx    # local goody x
    local gy    # local goody y
    local pos=1 # variable to hold character at future posiotion

    [[ -z $gch ]] && gch="*"    # if no goody char is present default is '*'

    # Generate random position
    while true
    do
        gy=$((RANDOM % (lheight)+1))        # random y
        gx=$((RANDOM % (${#lvl[gy-1]})+1))  # random x

        #pos=${lvl[gy-1]:gx-1:1}             # character at position gx and gy
        pos=$(getelem $gx $gy)
        pos=${pos:-1}                       # if out of range pos = 1

        # If random position is clear of walls, player, and badguy break
        [[ $pos == 0 ]] && break
    done

    setelem $gx $gy "G"                             # set area to goody
    printf "\e[${gcol}m\e[${gy};${gx}H${gch}\e[m"   # print goody
}

# Move player
function move_player ()
{
    # Set increment variables
    local ix=$1
    local iy=$2

    # Make sure player is not moving beyond screen limit
    [[ $((px+ix)) -gt $((scr_width-(pchlen-1))) ]] && ix=0
    [[ $((px+ix)) -lt 1 ]] && ix=0
    [[ $((py+iy)) -gt $scr_height ]] && iy=0
    [[ $((py+iy)) -lt 1 ]] && iy=0
    
    local dia=${lvl[$((py+iy))-1]:$((px+ix))-1:1}
    local horiz=${lvl[py-1]:$((px+ix))-1:1}
    local virt=${lvl[$((py+iy))-1]:px-1:1}

    setelem $px $py "0"       # clear old position

    #printf "\e[0;0H\e[2Kp=${lvl[$((((py+$2))-1))]:$((((px+$1))-1)):1}:x=${px}:y=${py}"

    # Make sure player is not moving onto a wall
    #if [[ $(getelem $((px+ix)) $((py+iy))) != 1 ]]
    #if [[ ${lvl[$((py+iy))-1]:$((px+ix))-1:1} != 1 ]]
    if [[ $dia != 1 ]]
    then
        #printf "\e[0;30H\e[2Kp=${lvl[$((((py+$2))-1))]:$((((px+$1))-1)):1}:x=${px}:y=${py}"
        clrpos $px $py $pchlen  # clear old position
        px=$((px+ix))   # add $1 to px
        py=$((py+iy))   # add $2 to py

    # Player can't move diagonally
    #elif [[ $(getelem $((px+ix)) $py) != 1 ]]
    #elif [[ ${lvl[py-1]:$((px+ix))-1:1} != 1 ]]
    elif [[ $horiz != 1 ]]
    then
        clrpos $px $py $pchlen  # clear old position
        px=$((px+ix))   # add $1 to px
    #elif [[ $(getelem $px $((py+iy))) != 1 ]]
    #elif [[ ${lvl[$((py+iy))-1]:px-1:1} != 1 ]]
    elif [[ $virt != 1 ]]
    then
        clrpos $px $py $pchlen  # clear old position
        py=$((py+iy))   # add $2 to py
    fi

    local newpos=${lvl[py-1]:px-1:1}

    # Did player eat goody
    #if [[ $(getelem $px $py) == "G" ]]
    #if [[ ${lvl[py-1]:px-1:1} == "G" ]]
    if [[ $newpos == "G" ]]
    then
        ((gcount++))        # increment goody counter

        # Change level if required amount of goodies have been consumed
        if [[ $gcount -eq $greq ]]  
        then
            ((curlvl++))    # increment level counter

            # Player wins if last level is successfuly finished
            [[ $curlvl -gt $numlvls ]] && youwin
            load_lvl
        fi
        #placegoodie     # place new goody
        ((bspeed+=5))   # slow badguy down
    fi

    setelem $px $py "P"       # Set current position
}

# Move badguy
function move_badguy ()
{
    local nx=${bx[cb]}
    local ny=${by[cb]}
    local newpos=1
    local dia=${lvl[$((${by[cb]}+$2))-1]:$((${bx[cb]}+$1))-1:1}
    local virt=${lvl[$((${by[cb]}+$2))-1]:${bx[cb]}-1:1}
    local horiz=${lvl[${by[cb]}-1]:$((${bx[cb]}+$1))-1:1}

    # Make sure badguy is not moving onto a wall
    #if [[ $(getelem $((${bx[cb]}+$1)) $((${by[cb]}+$2))) -ne 1 ]]
    #if [[ ${lvl[$((${by[cb]}+$2))-1]:$((${bx[cb]}+$1))-1:1} -ne 1 ]]
    if [[ $dia -ne 1 ]]
    then
        nx=$((${bx[cb]}+$1))
        ny=$((${by[cb]}+$2))
    #elif [[ $(getelem ${bx[cb]} $((${by[cb]}+$2))) -ne 1 ]]
    #elif [[ ${lvl[$((${by[cb]}+$2))-1]:${bx[cb]}-1:1} -ne 1 ]]
    elif [[ $virt -ne 1 ]]
    then
        nx=${bx[cb]}
        ny=$((${by[cb]}+$2))
    #elif [[ $(getelem $((${bx[cb]}+$1)) ${by[cb]}) -ne 1 ]]
    #elif [[ ${lvl[${by[cb]}-1]:$((${bx[cb]}+$1))-1:1} -ne 1 ]]
    elif [[ $horiz -ne 1 ]]
    then
        nx=$((${bx[cb]}+$1))
        ny=${by[cb]}
    fi

    newpos=${lvl[ny-1]:nx-1:1}
    #newpos=$(getelem $nx $ny)

    if [[ $newpos != "B" ]]
    then
        setelem ${nx} ${ny} "B"       # set new position

        setelem ${bx[cb]} ${by[cb]} "0"       # clear old position

        clrpos ${bx[cb]} ${by[cb]} $bchlen    # clear old position

        # Check if badguy ate the goody
        if [[ $newpos == "G" ]]
        then
            placegoodie         # place new goody
            ((bspeed-=50))      # increase badguy speed
        fi
        #bx[$cb]=$((${bx[cb]}+$1))              # increase x by $1
        #by[$cb]=$((${by[cb]}+$2))              # increese y by $2

        bx[$cb]=$nx
        by[$cb]=$ny
    fi

    printf "\e[${bcol};1m\e[${by[cb]};${bx[cb]}H${bch:bchc:1}\e[m"   # print badguy
}
 
function main ()
{
    # Initialize game
    init
    load_lvl
    #drawlvl $curlvl $draw_mode
    #placegoodie

    # Main loop
    while [[ $char != $esc ]]   # loop until player hits escape
    do
        read char       # get current char

        # Check what player wants to do
        case $char in
            "e" | "E")      # auto win
                youwin
                ;;
            "r" | "R")      # reload level
                load_lvl 
                #placegoodie     # place new goody
                ;;
            "*" ) placegoodie ;;
            "t" | "T")      # redraw level and goody
                drawlvl $curlvl $draw_mode
                placegoodie
                ;;
            "p" | "P")      # pause game
                char=
                while [[ $char != "p" && $char != "P" ]]
                do
                    read char
                done
                ;;
            "g" | "G")      # invincible
                invincible=$((!invincible))
                ;;
            "f" | "F")      # freeze badguys
                if [[ -z $obc ]]
                then
                    obc=$bc
                    bc=0
                else
                    bc=$obc
                    obc=
                fi
                ;;
            "w" | "W")      # warp to level
                char=
                lnum=
                while [[ $char != "d" ]]
                do
                    read char
                    case $char in
                        [[:digit:]]) lnum=$lnum$char ;;
                    esac
                done
                if [[ -n $lnum ]]
                then
                    if [[ $lnum -gt 0 ]]
                    then
                        curlvl=$lnum
                        load_lvl
                        #placegoodie     # place new goody
                    fi
                fi
                ;;
            "[A" | "8" | "k")   # move up
                move_player 0 -1
                pch="V!"    # up animation
                ;;
            "[B" | "2" | "j")   # move down
                move_player 0 1
                pch="A!"    # down animation
                ;;
            "[C" | "6" | "l")   # move right
                move_player 1 0 
                pch="<-"    # right animation
                ;;
            "[D" | "4" | "h")   # move left
                move_player -1 0
                pch=">-"    # left animation
                ;;
            "[1~" | "7" | "u")  # move diagonally left and up
                move_player  -1 -1
                pch="V!>-"
                ;;
            "[5~" | "9" | "o")  # move diagonally right and up
                move_player 1 -1
                pch="V!<-"
                ;;
            "[4~" | "1" | "n")  # move diagonally left and down
                move_player -1 1
                pch="A!>-"
                ;;
            "[6~" | "3" | ",")  # move diagonally right and down
                move_player 1 1
                pch="A!<-"
                ;;
        esac

        printf "\e[${pcol};1m\e[${py};${px}H${pch:pchc:pchlen}\e[m"   # print player

        # Move badguy
        if [[ $btimer -ge $bspeed && $bc -gt 0 ]]
        then
            # Chase player
            bmx=0
            bmy=0
            if [[ ${bx[cb]} -lt $px ]]
            then
                bmx=1
                #move_badguy 1 0     # left
                #bch="Oo"
            fi
            if [[ ${bx[cb]} -gt $px ]]
            then
                bmx=-1
                #move_badguy -1 0    # right
                #bch="Oo"
            fi
            if [[ ${by[cb]} -lt $py ]]
            then
                bmy=1
                #move_badguy 0 1     # down
                #bch="Oo"
            fi
            if [[ ${by[cb]} -gt $py ]]
            then
                bmy=-1
                #move_badguy 0 -1    # up
                #bch="Oo"
            fi
            move_badguy $bmx $bmy
            cb=$(((cb+=1) % $bc))
            [[ $cb -eq 0 ]] && btimer=0        # reset badguy timer
        fi 
        [[ $cb -eq 0 ]] && ((btimer++))   # increment badguy timer

        # Player looses if badguy eats him
        [[ ${lvl[py-1]:px-1:1} == "B" && $invincible -eq 0 ]] && youloose

        # Animate characters
        if [[ $cht -eq 300 ]]
        then
            bchc=$(((bchc+1)%${#bch}))    # increment bchc to max len bch and reset it
            pchc=$(((pchc+1)%${#pch}))    # increment pchc to max len pch and reset it
            cht=0   # reset animation timer
        fi
        ((cht++))   # increment animation timer
    done
}

[[ $0 == "shadow.bash" ]] && main

# Exit
