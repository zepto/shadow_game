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
        "#*"   # wall and goody character
        "33")

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
        "#*"   # wall and goody character
        "32")

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
        "#*"   # wall and goody character
        "34")

level4=("00000000000000000000000000000000000000000000000000000000000000000000000000000000" 
        "0000000000000000P000000000000000000000000000000000000000000000000000000000000000" 
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000" 
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000" 
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000" 
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000" 
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000" 
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000" 
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000" 
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000" 
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000" 
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000" 
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000" 
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000" 
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000" 
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000" 
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000" 
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000" 
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000" 
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000" 
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000" 
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000" 
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000" 
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000" 
        "00000000000000000000000000000000000000000000000000000000000000000000000000000000"
        "#*"   # wall and goody character
        "34")

# Exit on signals 0, 1, 2, and 3
trap exitit 0 1 2 3

clear   # clear screen

stty -icanon time 0 min 0 -echo     # do not wait for key press and don't echo
printf "\e[?25l"    # hide cursor

# Global variables
Rows=25                 # level rows
Columns=80              # level columns
curlvl=1                # current level
numlvls=4               # number of levels
greq=2                  # goodies required
lastlvl=${!level@}       # last level
maxlvls=${lastlvl: -1}  # maximum numbers of levels

lvl=()                  # level array
scr_height=$Rows        # screen height
scr_width=$Columns    # screen width

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
bx=()       # badguy x array
by=()       # badguy y array
bcol=91     # badguy color

cht=0       # animation timer

gcount=0    # goody counter
gcol=35     # goodie color

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
    printf "${lvl[y-1]:x-1:1}"
}

# Set element in level array
function setelem ()
{
    local x=$1
    local y=$2
    [[ $y -le 0 ]] && return
    lvl[$y-1]=${lvl[y-1]:0:x-1}$3${lvl[y-1]:x}
}

# Draw level
function drawlvl ()
{
    local i=0       # local index
    local t=0       # local temp
    local rnum=0    # local random number
    local ltemp=()  # local temp level

    bc=0            # reset badguy counter
    cb=0            # reset current badguy
    lvl=${lvl:+()}  # set lvl to empty

    clear           # clear screen

    # Check what level to load
    #case $1 in
        #1) lvl=(${level1[@]}) ;;
        #2) lvl=(${level2[@]}) ;;
        #*) lvl=()   # if level is not made it will be random
    #esac
    lev="level${1}[@]:-()"
    lvl=(${!lev})

    wall=${lvl[25]:0:1}         # wall is first char of last element
    [[ -z $wall ]] && wall="#"  # if no was default is '#'
    wall_col=${lvl[26]:-32}     # wall color is the 26th element

    if [[ $3 != "drawother" ]]; then
        # Main level drawing loop
        for ((y=1; y<=Rows; y++))
        do
            wid=${#lvl[y-1]}
            for ((x=1; x<=wid; x++))
            do
                # Generate Random level
                if [[ $1 -gt $maxlvls ]]
                then
                    rnum=$((RANDOM % 100))  # random number from 0-100
                    if [[ $rnum -lt $((60+$1)) ]] # make levels progressively harder
                    then
                        t=0                 # clear area of level
                    else
                        t=1                 # wall
                    fi
                    #[[ $x -eq 1 || $y -eq 1 || $x -eq $Columns || $y -eq Rows ]] && t=1
                    if [[ $x -eq 10 && $y -eq 10 ]] # players starting position
                    then
                        t="P"               
                    elif [[ $x -eq 20 && $y -eq 20 ]] # badguys starting position
                    then
                        t="B"
                    fi

                    lvl[y-1]=${lvl[y-1]}$t # append character to current line
                fi
                ######################

                # Draw level
                case ${lvl[y-1]:x-1:1} in
                    # Draw wall
                    1) printf "\e[${wall_col}m\e[${y};${x}H${wall}\e[m" ;;
                    # Set player starting position
                    "P") px=$x; py=$y ;;
                    # set badguy starting position
                    "B") 
                        bx[$bc]=$x
                        by[$bc]=$y
                        bspeed=200
                        ((bc++)) 
                        ;;
                esac
            done
        done
    fi
    if [[ $3 == "drawother" ]]
    then
        ltemp=(${lvl[@]//1/$wall})          # replace 1's with wall
        ltemp=(${ltemp[@]//[0PB]/"\040"})   # replace 0's with space

        # Draw Level
        for y in {1..25}
        do
            t_x=$(expr index ${lvl[y-1]} P) # get index of player
            if [[ $t_x -ne 0 ]]
            then
                px=$t_x     # set player start if found
                py=$y
            fi
            t_num=1

            # Find and set badguy start
            while [[ $t_num -ne 0 && $t_x -le $Columns ]]
            do
                t_num=$(expr index ${lvl[y-1]:t_x} B)   # get index of badguy
                [[ $t_num -eq 0 ]] && break     # break if not found
                t_x=$((t_x+=t_num))             # add index to current index
                bx[bc]=$((t_x-1))
                by[bc]=$y
                ((bc++))        # increment badguy counter
            done
            printf "\e[${wall_col}m\e[${y};0H${ltemp[y-1]}\e[m"
        done
        bspeed=200
    fi
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
        #if [[ $(getelem $gx $gy) -ne 1 ]] 
        if [[ ${lvl[gy-1]:gx-1:1} -ne 1 ]]
        then
            if [[ $gx -ne $px && $gy -ne $py ]]
            then
                for ((i=0; i<=bc; i++))
                do
                    if [[ $gx -ne ${bx[i]} && $gy -ne ${by[i]} ]]
                    then
                        setelem $gx $gy "G" # set area to goody

                        printf "\e[${gcol}m\e[${gy};${gx}H${gch}\e[m"  # print goody
                        return
                    fi
                done
           fi
       fi
    done

}

# Move player
function move_player ()
{
    # Set increment variables
    local ix=$1
    local iy=$2

    # Make sure player is not moving beyond screen limit
    [[ $((px+$1)) -gt $((scr_width-pchlen)) ]] && ix=0
    [[ $((px+$1)) -lt 1 ]] && ix=0
    [[ $((py+$2)) -gt $scr_height ]] && iy=0
    [[ $((py+$2)) -lt 1 ]] && iy=0

    #printf "\e[0;0H\e[2Kp=${lvl[$((((py+$2))-1))]:$((((px+$1))-1)):1}:x=${px}:y=${py}"

    # Make sure player is not moving onto a wall
    #if [[ $(getelem $((px+$1)) $((py+$2))) != 1 ]]
    if [[ ${lvl[$((py+iy))-1]:$((px+ix))-1:1} != 1 ]]
    then
        #printf "\e[0;30H\e[2Kp=${lvl[$((((py+$2))-1))]:$((((px+$1))-1)):1}:x=${px}:y=${py}"
        clrpos $px $py $pchlen  # clear old position
        px=$((px+ix))   # add $1 to px
        py=$((py+iy))   # add $2 to py
    # Player can't move diagonally
    #elif [[ $(getelem $((px+$1)) $py) != 1 ]]
    elif [[ ${lvl[py-1]:$((px+ix))-1:1} != 1 ]]
    then
        clrpos $px $py $pchlen  # clear old position
        px=$((px+ix))   # add $1 to px
    #elif [[ $(getelem $px $((py+$2))) != 1 ]]
    elif [[ ${lvl[$((py+iy))-1]:px-1:1} != 1 ]]
    then
        clrpos $px $py $pchlen  # clear old position
        py=$((py+iy))   # add $2 to py
    fi

    # Did player eat goody
    #if [[ $(getelem $px $py) == "G" ]]
    if [[ ${lvl[py-1]:px-1:1} == "G" ]]
    then
        ((gcount++))        # increment goody counter
        # Change level if required amount of goodies have been consumed
        if [[ $gcount -eq $greq ]]  
        then
            ((curlvl++))    # increment level counter

            # Player wins if last level is successfuly finished
            [[ $curlvl -gt $numlvls ]] && youwin

            btimer=0        # reset bagduy timer
            gcount=0        # reset goody counter
            drawlvl $curlvl # draw new level

        fi
        placegoodie     # place new goody
        ((bspeed+=5))   # slow badguy down
    fi
}

# Move badguy
function move_badguy ()
{
    local nx=${bx[cb]}
    local ny=${by[cb]}

    # Make sure badguy is not moving onto a wall
    #if [[ $(getelem $((${bx[$cb]}+$1)) $((${by[$cb]}+$2))) -eq 0 ]]
    if [[ ${lvl[$((${by[cb]}+$2))-1]:$((${bx[cb]}+$1))-1:1} -ne 1 ]]
    then
        nx=$((${bx[cb]}+$1))
        ny=$((${by[cb]}+$2))
    elif [[ ${lvl[$((${by[cb]}+$2))-1]:${bx[cb]}-1:1} -ne 1 ]]
    then
        nx=${bx[cb]}
        ny=$((${by[cb]}+$2))
    elif [[ ${lvl[${by[cb]}-1]:$((${bx[cb]}+$1))-1:1} -ne 1 ]]
    then
        nx=$((${bx[cb]}+$1))
        ny=${by[cb]}
    fi

    #if [[ $(getelem $((${bx[$cb]}+$1)) $((${by[$cb]}+$2))) != "B" ]]
    #if [[ ${lvl[$((${by[$cb]}+$2))-1]:$((${bx[$cb]}+$1))-1:1} == "B" ]]
    if [[ ${lvl[ny-1]:nx-1:1} != "B" ]]
    then
        setelem ${bx[cb]} ${by[cb]} "0"       # clear old position

        # Check if badguy ate the goody
        #if [[ $(getelem $((${bx[$cb]}+$1)) $((${by[$cb]}+$2))) == "G" ]]
        #elif [[ ${lvl[$((${by[$cb]}+$2))-1]:$((${bx[$cb]}+$1))-1:1} == "G" ]]
        if [[ ${lvl[$ny-1]:$nx-1:1} == "G" ]]
        then
            placegoodie         # place new goody
            ((bspeed-=50))      # increase badguy speed
        fi
        clrpos ${bx[cb]} ${by[cb]} $bchlen    # clear old position
        #bx[$cb]=$((${bx[cb]}+$1))              # increase x by $1
        #by[$cb]=$((${by[cb]}+$2))              # increese y by $2
        bx[$cb]=$nx
        by[$cb]=$ny
        setelem ${bx[cb]} ${by[cb]} "B"       # set new position
    fi

    printf "\e[${bcol};1m\e[${by[cb]};${bx[cb]}H${bch:bchc:1}\e[m"   # print badguy
}

# Initialize game
drawlvl $curlvl #0 "drawother"
placegoodie

# Main loop
while [[ $char != $esc ]]   # loop until player hits escape
do
    read char       # get current char

    # Check what player wants to do
    case $char in
        "[A" | "8")     # move up
            move_player 0 -1
            pch="V!"  # up animation
            ;;
        "[B" | "2")     # move down
            move_player 0 1
            pch="A!"  # down animation
            ;;
        "[C" | "6")     # move right
            move_player 1 0 
            pch="<-"  # right animation
            ;;
        "[D" | "4")     # move left
            move_player -1 0
            pch=">-"  # left animation
            ;;
        "[1~" | "7")    # move diagonally left and up
            move_player  -1 -1
            pch="V!>-"
            ;;
        "[5~" | "9")    # move diagonally right and up
            move_player 1 -1
            pch="V!<-"
            ;;
        "[4~" | "1")    # move diagonally left and down
            move_player -1 1
            pch="A!>-"
            ;;
        "[6~" | "3")    # move diagonally right and down
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
    #[[ ${lvl[py-1]:px-1:1} == "B" ]] && youloose

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
