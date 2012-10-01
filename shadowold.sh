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
        "10000000000000000000000B00000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "11111111111111111111111111111111111111111111111111111111111111111111111111111111"
        "#*")   # wall and goody character

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
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "10000000000000000000000000000000000000000000000000000000000000000000000000000001" 
        "11111111111111111111111111111111111111111111111111111111111111111111111111111111"
        "#*")   # wall and goody character

# Exit on signals 0, 1, 2, and 3
trap exitit 0 1 2 3

clear   # clear screen

stty -icanon time 0 min 0 -echo     # do not wait for key press and don't echo
printf "\e[?25l"    # hide cursor

# Global variables
Rows=25             # level rows
Columns=80          # level columns
curlvl=1            # current level
numlvls=4           # number of levels
greq=10             # goodies required

lvl=()              # level
scr_height=$Rows        # screen height
scr_width=$Columns+1    # screen width

esc=`printf "\e"`   # ESC

pch="<-"          # player animation
pchc=0              # animation counter
pchlen=1 #${#pch}   # player length

bch="Oo~o"         # badguy animation
bchc=0              # animation counter
bchlen=1 #${#bch}   # badguy length
bspeed=200          # badguy speed
btimer=0            # badguy speed timer

cht=0               # animation timer

gcount=0            # goody counter

# Clean up screen at exit
function exitit ()
{
    printf "\e[?25h\e[m"    # show cursor and reset colors
    stty icanon echo        # turn echo backon and wait for keys
    #clear                  # clear screen
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
    printf "${lvl[$y-1]:$x-1:1}"

    #i=$((x * Columns + y))
    #printf "${ar[$i]}"
}

# Set element in level array
function setelem ()
{
    local x=$1
    local y=$2
    [[ $y -eq 0 ]] && return
    lvl[$y-1]=${lvl[$y-1]:0:$x-1}$3${lvl[$y-1]:$x}
}

# Draw level
function drawlvl ()
{
    local i=0       # local index
    local t=0       # local temp
    local rnum=0    # local random number

    #local lvlr=0

    clear           # clear screen

    # Check what level to load
    case $1 in
        1) lvl=(${level1[@]}) ;;
        2) lvl=(${level2[@]}) ;;
        *) lvl=()   # if level is not made it will be random
    esac

    wall=${lvl[25]:0:1}         # wall is first char of last element
    [[ -z $wall ]] && wall="#"  # if no was default is '#'

    # Main level drawing loop
    for ((y=1; y<=$Rows; y++))
    do
        for ((x=1; x<=$Columns; x++))
        do
            #i=$((x * Columns + y))

            # Generate Random level
            if [[ $1 -gt 2 ]]
            then
                rnum=$((RANDOM % 100))  # random number from 0-100
                if [[ $rnum -lt $((80+$1)) ]] # make levels progressively harder
                then
                    t=0                 # clear area of level
                    #ar[$i]=0
                else
                    t=1                 # wall
                    #ar[$i]=1
                fi
                if [[ $x -eq 10 && $y -eq 10 ]] # players starting position
                then
                    t="P"               
                    #ar[$i]="P"
                elif [[ $x -eq 20 && $y -eq 20 ]] # badguys starting position
                then
                    t="B"
                    #ar[$i]="B"
                fi

                lvl[$y-1]=${lvl[$y-1]}$t # append character to current line

                #ar[$i]=${lvl[$lvlr]:$((x-1)):1}
            fi
            ######################

            # Draw level
            case ${lvl[$y-1]:$x-1:1} in
                # Draw wall
                1) printf "\e[32m\e[${y};${x}H${wall}\e[m" ;;
                # Set player starting position
                "P") px=$x; py=$y ;;
                # set badguy starting position
                "B") bx=$x; by=$y ;;
            esac
        done
        #((lvlr++))
    done
    #if [[ $1 -ge 3 ]]
    #then
        #px=10
        #py=10
        #bx=20
        #by=20
        #i=$((10 * Columns + 10))
        #ar[$i]=0
        #i=$((20 * Columns + 20))
        #ar[$i]=0
    #fi
}

# Place goody
function placegoodie ()
{
    local gx    # local goody x
    local gy    # local goody y
    local gch=${lvl[25]:1:1}    # goody is second char of last element
    [[ -z $gch ]] && gch="*"    # if no goody char is present default is '*'

    setelem $px $py "0"     # clear old goody area

    # Generate random position
    while true
    do
        gx=$(((RANDOM % (Columns-1))+1))    # random x
        gy=$(((RANDOM % (Rows-1))+1))       # random y
        # If random position is clear of walls, player, and badguy print it
        if [[ $(getelem $gx $gy) -ne 1 ]] 
        then
            if [[ $gx -ne $px && $gy -ne $py ]]
            then
                if [[ $gx -ne $bx && $gy -ne $by ]]
                then
                    break
                fi
           fi
       fi
    done

    setelem $gx $gy "G" # set area to goody

    printf "\e[${gy};${gx}H${gch}"  # print goody
}

# Move player
function move_player ()
{
    # Make sure player is not moving beyond screen limit
    [[ $((px+$1)) -gt $(($scr_width-$pchlen)) ]] && return
    [[ $((px+$1)) -lt 1 ]] && return 
    [[ $((py+$2)) -gt $scr_height ]] && return 
    [[ $((py+$2)) -lt 1 ]] && return 

    #printf "\e[0;0H\e[2Kp=${lvl[$((((py+$2))-1))]:$((((px+$1))-1)):1}:x=${px}:y=${py}"

    # Make sure player is not moving onto a wall
    if [[ $(getelem $((px+$1)) $((py+$2))) != 1 ]]
    then
        #printf "\e[0;30H\e[2Kp=${lvl[$((((py+$2))-1))]:$((((px+$1))-1)):1}:x=${px}:y=${py}"
        clrpos $px $py $pchlen  # clear old position
        px=$((px+$1))   # add $1 to px
        py=$((py+$2))   # add $2 to py
    # Player can't move diagonally
    elif [[ $(getelem $((px+$1)) $py) != 1 ]]
    then
        clrpos $px $py $pchlen  # clear old position
        px=$((px+$1))   # add $1 to px
    elif [[ $(getelem $px $((py+$2))) != 1 ]]
    then
        clrpos $px $py $pchlen  # clear old position
        py=$((py+$2))   # add $2 to py
    fi

    printf "\e[${py};${px}H${pch:pchc:1}"   # print player

    # Did player eat goody
    if [[ $(getelem $px $py) == "G" ]]
    then
        ((gcount++))        # increment goody counter
        # Change level if required amount of goodies have been consumed
        if [[ $gcount -eq $greq ]]  
        then
            ((curlvl++))    # increment level counter

            # Player wins if last level is successfuly finished
            [[ $curlvl -gt $numlvls ]] && youwin

            drawlvl $curlvl # draw new level
            gcount=0        # reset goody counter
            bspeed=200      # reset badguy speed
        fi
        placegoodie     # place new goody
        ((bspeed+=5))   # slow badguy down
    fi

}

# Move badguy
function move_badguy ()
{
    # Make sure badguy is not moving onto a wall
    if [[ $(getelem $((bx+$1)) $((by+$2))) -eq 0 ]]
    then
        # Check if badguy ate the goody
        if [[ $(getelem $((bx+$1)) $((by+$2))) == "G" ]]
        then
            setelem $bx $by "0" # clear old goody area
            placegoodie         # place new goody
            ((bspeed-=50))      # increase badguy speed
        fi
        clrpos $bx $by $bchlen  # clear old position
        bx=$((bx+$1))           # increase x by $1
        by=$((by+$2))           # increese y by $2
    fi
    
    printf "\e[${by};${bx}H${bch:bchc:1}"   # print badguy
}

# Initialize game
drawlvl $curlvl
placegoodie

# Main loop
while [[ $char != $esc ]]   # loop until player hits escape
do
    read char       # get current char

    # Check what player wants to do
    case $char in
        "[A")     # move up
            move_player 0 -1
            pch="V!"  # up animation
            ;;
        "[B")     # move down
            move_player 0 1
            pch="A!"  # down animation
            ;;
        "[C")     # move right
            move_player 1 0 
            pch="<-"  # right animation
            ;;
        "[D")     # move left
            move_player -1 0
            pch=">-"  # left animation
            ;;
        "[1~")    # move diagonally left and up
            move_player  -1 -1
            pch="V!>-"
            ;;
        "[5~")    # move diagonally right and up
            move_player 1 -1
            pch="V!<-"
            ;;
        "[4~")    # move diagonally left and down
            move_player -1 1
            pch="A!>-"
            ;;
        "[6~")    # move diagonally right and down
            move_player 1 1
            pch="A!<-"
            ;;
    esac

    printf "\e[${py};${px}H${pch:pchc:1}"   # print player

    # Move badguy
    if [[ $btimer -eq $bspeed ]]
    then
        # Chase player
        if [[ $bx -lt $px ]]
        then
            move_badguy 1 0     # left
            #bch="Oo"
        fi
        if [[ $bx -gt $px ]]
        then
            move_badguy -1 0    # right
            #bch="Oo"
        fi
        if [[ $by -lt $py ]]
        then
            move_badguy 0 1     # down
            #bch="Oo"
        fi
        if [[ $by -gt $py ]]
        then
            move_badguy 0 -1    # up
            #bch="Oo"
        fi
        btimer=0        # reset badguy timer
    fi
    #printf "\e[${by};${bx}H${bch:bchc:1}"   # print badguy
    ((btimer++))    # increment badguy timer

    # Player looses if badguy eats him
    [[ $by -eq $py && $bx -eq $px ]] && youloose

    # Animate characters
    if [[ $cht -eq 300 ]]
    then
        bchc=$(((bchc+1)%${#bch}))    # increment bchc to max len bch and reset it
        pchc=$(((pchc+1)%${#pch}))    # increment pchc to max len pch and reset it
        cht=0   # reset animation timer
    fi
    ((cht++))   # increment animation timer
done
# Exit
