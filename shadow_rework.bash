#!/bin/bash

# A game.  Eat the correct number of X's to move to the next level,
# but don't let the shadow catch you!
#
# Shadow Copyright (C) 2009-2010  Josiah Gordon <josiahg@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) anew_y later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# The level format is as follows:
# 1's = walls
# 0's = empty space
# P   = player starting position
# B's = shadow starting positions (also determines the number of shadows)

# The last line of the level (optional):
# W followed by a character = the wall character
# C followed by a number    = the wall color
# S followed by a number    = the background color

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
        "W#S194C132"
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
        "C095"
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
        "C094"
        )

level4=("1111" 
        "10P1"
        "100111111111111111111111111111111111"
        "1000000000000000000000000000100000B1"
        "100000000000000000001000000010000001"
        "100000000000000000001000000000000001"
        "100000111111111111111111000000001111"
        "100000100000000000000000000000000001"
        "100000100000000000000000000000000001"
        "100000100000000000000000000000000001"
        "100000100000000000000000000000000001"
        "100000100000000000000000000000000001"
        "100000111111111111111111000000000001"
        "100000000000000000000000000000010001"
        "100000000000000000000000000000010001"
        "111111111111111111111111111111111111"
        )

level5=("1111" 
        "10P1"
        "1001111111111111111111111111111111111111111111111111111111111111111111"
        "1001111111111111111110000000000000000000000000000000000000000001111111"
        "1001111111111111111110000000000000000000000000000000000000000001111111"
        "1000000000000000000000000000000111111110111111000000000000000000000001"
        "10000000000000000000000000000000000000000000B100000000B000000000000001"
        "1000000000000000000000000000000111111110111111000000000000000000000001"
        "1001100001011111111110000000000000000000000000000000000000000001111111"
        "1001100001011100000011111111000000000000000000000000000000000001111111"
        "1101100001010001111000000001111111111111111111111111111100000000000001"
        "1101100001010111111111111101100010000000000000000000000000000000000001"
        "1101100001010100000000000101101010111111111111111111111100000000000001"
        "11011000010B0100000000000100001000100000000000000000000000000000000001"
        "1101100B01000100000000000111111111100000000000000000000000000000000001"
        "110110000111110000000000000000000000000000000000000000B000000000000001"
        "1101100000000001110111000000000000000000000000000000000011111111111101"
        "1101100000000001110111000000000000001111111111111111111110001111111101"
        "1100000000000000010000000000000000000000000000000000000000100000000001"
        "1111111111111111111111111111111111111111111111111111111111111111111111"
        )

# Global associative arrays variables
declare -A level
declare -A animation
declare -A current_frame
declare -A frame_length
declare -A color_hash
declare -A shadow
declare -A stars

# Return the current time to the current nanosecond.
function timer ()
{
    printf "$(date +%s%N)"
}

# Initialize global variables.
function init_globals ()
{
    eval $(resize)
    if [[ $LINES -lt 25 || $COLUMNS -lt 80 ]]
    then
        echo "Requires atleast 80x25"
        exit
    fi

    # Initialize the global variables.

    # Setup level hash.
    level[height]=$LINES
    level[width]=$COLUMNS
    level[current]=1
    # The total number of levels.  Anew_y level that is not pre-made will be 
    # generated.
    level[total]=10

    # A temperary variable to hold the last level.
    tmp_level=${!level@}

    # The last pre-made level number.
    level[last]=${tmp_level: -1}

    # The level drawing mode.
    level[draw_mode]="buffered"

    # An array to hold the current level.
    level_mask=()

    # The screen width and height variables.
    screen_height=$LINES
    screen_width=$COLUMNS

    # Declare a bash hash's.

    # Setup the player's animation.
    animation[player]="<-"
    current_frame[player]=0
    frame_length[player]=1
    color_hash[player]="34;1"
    player_x=
    player_y=

    # Setup the shadows animation.
    animation[shadow]="+-+|"
    current_frame[shadow]=0
    frame_length[shadow]=1
    color_hash[shadow]="31;1"

    # Setup the shadows movement.

    shadow[speed]=100
    shadow[total]=0
    shadow[current]=0
    shadow[frozen]=0

    # Arrays to hold the shadows position.
    shadow_x=()
    shadow_y=()

    # Initialize the shadows movement timer.
    shadow[timer]=$(timer)

    # Setup the stars.

    stars[collected]=0
    #animation[stars]="-*oO"
    animation[stars]=".xX" #-*X" #-*oO"
    current_frame[stars]=0
    frame_length[stars]=1

    #stars[character]="*"
    color_hash[stars]="31;1"
    stars[x]=
    stars[y]=

    # The number of *'s the player has to collect to finish a level.
    stars[total]=10 


    # Weather or not the player is invincible.
    invincible=0

    # What character to end the ansii color sequence with.
    color_end='m'
}

# Initialize screen and input
function init ()
{
    init_globals

    # Exit on signals 0, 1, 2, and 3
    trap exitit 0 1 2 3

    # Use the number of seconds sinch 1970 to seed the random number 
    # generator.
    RANDOM=`date +%s`

    # Clear the screen.
    clear

    # Do not wait for key press and don't echo.
    stty -icanon time 0 min 0 -echo

    # Hide the cursor.
    printf "\e[?25l"
}
# Return 1 if arg1 > arg2 0 if equal and -1 if less
function mcmp ()
{
    [[ $1 -gt $2 ]] && value=1
    [[ $1 -eq $2 ]] && value=0
    [[ $1 -lt $2 ]] && value=-1
    printf "%d" $value
}

# Clean up screen at exit
function exitit ()
{
    #[[ $? -eq 3 ]] && printf "Hello, World\n"
    # Show cursor and reset colors.
    printf "\e[?25h\e[m"

    # Turn on echo and wait for keys.
    stty icanon echo
}

# Player was eaten up
function you_loose ()
{
    exitit
    printf "Gotcha!\n"
    exit
}

# Player finished all the levels
function you_win ()
{
    exitit
    printf "You Win!\n"
    exit
}

# Clear character
function clear_position ()
{
    local x=$1
    local y=$2
    local length=$3

    # Move cursor to row y column x and print a space length characters long
    printf "\e[${y};${x}H%-${length}s"
}

# Get element from level array
function get_elem ()
{
    local x=$1
    local y=$2

    # Print character 'x' in element 'y' of 'level_mask' array
    printf "${level_mask[y-1]:x-1:1}"
}

# Set element in level array
function set_elem ()
{
    local x=$1
    local y=$2

    # Return if y is not in range.
    [[ $y -le 0 ]] && return

    # Set character 'x' in element 'y' of 'level_mask' array
    level_mask[$y-1]=${level_mask[y-1]:0:x-1}$3${level_mask[y-1]:x}
}

# Load level
function load_level()
{
    # Reset everything and load a new level.
    shadow[speed]=200
    stars[collected]=0
    shadow[total]=0 
    shadow[current]=0
    draw_level ${level[current]} ${level[draw_mode]}
    place_star
}

# Draw level
function draw_level ()
{
    local i=0
    local temp_char=0
    local rand_temp=0
    local level_buffer=()
    local empty_level="level${1}[*]" #:-()"
    local wall_color=
    local wall_char=
    local background_color=

    # Set to 1 when the player has been placed in a random level.
    local player_placed=0

    # The ansii sequence to use more than 16 colors.
    local more_colors=

    # Reset shadow count
    shadow[total]=0
    shadow[frozen]=

    # Set level to current level
    level_mask=(${!empty_level})

    clear

    # Get wall and star chars and wall color
    level[height]=$((${#level_mask[@]}-1))
    if [[ ${level[height]} -le 0 ]]
    then
        level[height]=$LINES
    else
        for ((i=0; i<=${#level_mask[level[height]]}; i++))
        do
            case ${level_mask[level[height]]:i:1} in
                # Wall char
                "W") wall_char="${level_mask[level[height]]:$((++i)):1}" ;;   
                # Wall color
                "C") wall_color=${level_mask[level[height]]:$((++i)):3}; ((i+=2)) ;;
                # Back color
                "S") background_color=${level_mask[level[height]]:$((++i)):3}; ((i+=2)) ;;
                # Not characters so break out of loop
                "1" | "0") ((level[height]++)); break ;;
                *) ((i++)) ;;
            esac
        done
    fi
    
    # Set defaults
    # The default wall character is a space, and the default wall color is 32.
    [[ -z $wall_char ]] && wall_char="\040"
    [[ -z $wall_color ]] && wall_color="032"
    # The default background color is nothing
    [[ -z $background_color ]] && background_color="009"

    # Print 'building level' message
    [[ -n $2 ]] && printf "\e[$((LINES/2));$(((COLUMNS/2)-20))H\e[34mBuilding level."

    if [[ "x$(tput colors 2>/dev/null)" = "x256" ]]
    then
        # Set background color if wall is a space '\040'
        if [[ $wall_char == "\040" ]]
        then
            background_color="48;5;${wall_color}" #&& wall=" "
        else
            background_color="48;5;${background_color}" #&& wall=" "
        fi
        if [[ $TERM = "fbterm" ]]
        then
            if [[ $wall_char == "\040" ]]
            then
                background_color="02;${wall_color}" #&& wall=" "
            else
                background_color="02;${background_color}" #&& wall=" "
            fi
            color_end="}"
            more_colors="01;"
        else
            more_colors="01;38;5;"
        fi
    else
        wall_color="3${wall_color: -1}"
        background_color="4${wall_color: -1}" #&& wall=" "
        color_hash[player]="3${color_hash[player]:1}"
        color_hash[shadow]="3${color_hash[shadow]:1}"
        color_hash[stars]="3${color_hash[stars]:1}"
        #background_color="$((${wall_color:1:1}+1))${wall_color: -1}" #&& wall=" "
        more_colors=
    fi

    # A binary number to determine the density of the random wall placement.
    local bin_num=$(echo "obase=2;print $((400 - $1))" | bc -ql)
    local bin_num_len=$((${#bin_num} - 1))

    # Main level drawing loop
    # Loop through each line in the level.
    for ((y=1; y<=${level[height]}; y++))
    do

        # Set the current level width to the length of the current line, or 
        # to the number of columns in the screen.
        level[width]=${#level_mask[y-1]}
        [[ ${level[width]} -eq 0 ]] && level[width]=$COLUMNS

        # Make screen_width equal to the length of the longest line.
        [[ ${level[width]} -gt $screen_width ]] && screen_width=${level[width]}

        # Loop through each character the the current line.
        for ((x=1; x<=level[width]; x++))
        do
            # Generate random level when the last pre-made level is finished.
            if [[ $1 -gt ${level[last]} ]]
            then
                # Get a random number and use the last bits value for the walls.
                rand_temp=$((RANDOM % (400 - $1)))
                temp_char=$((rand_temp >> bin_num_len))
                
                # Use a random number to determine if the player should be placed.
                rand_temp=$((RANDOM % 1000))
                if [[ $((rand_temp >> (RANDOM % ((RANDOM % 8) + 1)))) -eq 1 && $player_placed -ne 1 ]]
                then
                    temp_char="P"
                    player_placed=1
                fi

                # Make sure the player is not placed in this location.
                if [[ $((rand_temp >> (RANDOM % ((RANDOM % 8) + 1)))) -eq 0 ]]
                then
                    # Place shadows far enough from the player.
                    if [[ $y -ge 20 ]]
                    then
                        if [[ ${shadow[total]} -le $(($1 / 2)) ]]
                        then
                            temp_char="B"
                        fi
                    fi
                fi

                # Add the current character to the level.
                level_mask[y-1]=${level_mask[y-1]}$temp_char
            fi
            ######################

            # Draw level
            case ${level_mask[y-1]:x-1:1} in
                # Draw wall if unbuffered
                1) [[ -z $2 ]] && printf "\e[${more_colors}${wall_color}${color_end}\e[${background_color}${color_end}\e[${y};${x}H${wall_char}\e[m" ;;
                # Set player starting position.
                "P") 
                    player_x=$x
                    player_y=$y
                    ;;
                # Set shadow starting position.
                "B") 
                    shadow_x[${shadow[total]}]=$x
                    shadow_y[${shadow[total]}]=$y
                    shadow[speed]=200
                    ((shadow[total]++)) 
                    ;;
            esac
        done

        # Draw .'s while generating level
        [[ -n $2 ]] && printf "."
    done

    # Draw buffered level.
    if [[ $2 == "buffered" ]]
    then
        clear

        # Substitue 0's with spaces, and 1's with wall characters.
        level_buffer=(${level_mask[@]//[0PB]/"\040"})
        level_buffer=(${level_buffer[@]//1/"\e[${more_colors}${wall_color}${color_end}\e[${background_color}${color_end}${wall_char}\e[m"})

        # Draw the level on line at a time.
        for ((y=1; y<=level[height]; y++))
        do
            printf "\e[${y};0H${level_buffer[y-1]}\e[m"
        done
    fi
}

# Place star character at a random empty place.
function place_star ()
{ 
    # A variable to hold the value of the future star position.
    local is_clear=1

    # If the star animation is not set then the default is '.xX'
    [[ -z ${animation[stars]} ]] && animation[stars]=".xX"

    # Generate random position
    while true
    do
        # Get a random x and y position.
        stars[y]=$((RANDOM % (level[height])+1))
        stars[x]=$((RANDOM % (${#level_mask[stars[y]-1]})+1))

        # Get the value of the random position in the level mask.
        is_clear=${level_mask[stars[y]-1]:stars[x]-1:1} 
        # If the position is not set, then try again.
        [[ -z $is_clear ]] && continue

        # If random position is clear the get out of the loop.
        [[ $is_clear == 0 ]] && break
    done

    # Reserve a spot in the level mask for the star.
    set_elem ${stars[x]} ${stars[y]} "G"

    # Draw the star.
    printf "\e[${color_hash[stars]}m\e[${stars[y]};${stars[x]}H${animation[stars]:0:1}\e[m"
}

# Move player
function move_player ()
{
    # Variables to hold the player movement increment.
    local inc_x=$1
    local inc_y=$2

    # Make sure player is not moving beyond the screen limits.
    [[ $((player_x+inc_x)) -gt $((screen_width-(frame_length[player]-1))) ]] && inc_x=0
    [[ $((player_x+inc_x)) -lt 1 ]] && inc_x=0
    [[ $((player_y+inc_y)) -gt $screen_height ]] && inc_y=0
    [[ $((player_y+inc_y)) -lt 1 ]] && inc_y=0
    
    # Get the value of the future locations of the player.
    local dia=${level_mask[$((player_y+inc_y))-1]:$((player_x+inc_x))-1:1}
    local horiz=${level_mask[player_y-1]:$((player_x+inc_x))-1:1}
    local virt=${level_mask[$((player_y+inc_y))-1]:player_x-1:1}

    set_elem $player_x $player_y "0"       # clear old position

    # Make sure player is not moving onto a wall
    if [[ $dia != 1 ]]
    then
        # Clear the old position and place the player in the new position.
        clear_position $player_x $player_y ${frame_length[player]}
        player_x=$((player_x+inc_x))
        player_y=$((player_y+inc_y))
    # Player can't move diagonally
    elif [[ $horiz != 1 ]]
    then
        # Clear the old position and place the player in the new position.
        clear_position $player_x $player_y ${frame_length[player]}
        player_x=$((player_x+inc_x))
    elif [[ $virt != 1 ]]
    then
        # Clear the old position and place the player in the new position.
        clear_position $player_x $player_y ${frame_length[player]}
        player_y=$((player_y+inc_y))
    fi

    # The new valid player position.
    local new_pos=${level_mask[player_y-1]:player_x-1:1}

    if [[ $new_pos == "G" ]]
    then
        # The player collected a star so increment the number of 
        # stars collected.
        ((stars[collected]++))

        # Move to the next level if the player has collected the correct 
        # number of stars.
        if [[ ${stars[collected]} -eq ${stars[total]} ]]  
        then
            ((level[current]++))

            # Player wins if the last level is successfuly finished.
            [[ ${level[current]} -gt ${level[total]} ]] && you_win
            load_level
            return 
        else
            place_star
        fi
        # The shadow's speed is decreased when the player collects a star.
        ((shadow[speed]+=5))
    fi

    # Player looses if the shadow eats him.
    [[ ${level_mask[player_y-1]:player_x-1:1} == "B" && $invincible -eq 0 ]] && you_loose

    # Reserve a spot on the level mask for the player.
    set_elem $player_x $player_y "P"
}

# Move shadow
function move_shadow ()
{
    local new_x=${shadow_x[${shadow[current]}]}
    local new_y=${shadow_y[${shadow[current]}]}
    local new_pos=1
    local dia=${level_mask[$((${shadow_y[${shadow[current]}]}+$2))-1]:$((${shadow_x[${shadow[current]}]}+$1))-1:1}
    local virt=${level_mask[$((${shadow_y[${shadow[current]}]}+$2))-1]:${shadow_x[${shadow[current]}]}-1:1}
    local horiz=${level_mask[${shadow_y[${shadow[current]}]}-1]:$((${shadow_x[${shadow[current]}]}+$1))-1:1}

    # Make sure shadow is not moving onto a wall.
    if [[ $dia -ne 1 ]]
    then
        new_x=$((${shadow_x[${shadow[current]}]}+$1))
        new_y=$((${shadow_y[${shadow[current]}]}+$2))
    elif [[ $virt -ne 1 ]]
    then
        new_x=${shadow_x[${shadow[current]}]}
        new_y=$((${shadow_y[${shadow[current]}]}+$2))
    elif [[ $horiz -ne 1 ]]
    then
        new_x=$((${shadow_x[${shadow[current]}]}+$1))
        new_y=${shadow_y[${shadow[current]}]}
    fi

    # The new position current value.
    new_pos=${level_mask[new_y-1]:new_x-1:1}

    # No shadow is in the new position so place this one there.
    if [[ $new_pos != "B" ]]
    then
        # Reserve a spot on the level mask for the shadow.
        set_elem ${new_x} ${new_y} "B"

        # Clear the old position so anything else can be placed there.
        set_elem ${shadow_x[${shadow[current]}]} ${shadow_y[${shadow[current]}]} "0"

        # Clear the old shadow from the screen.
        clear_position ${shadow_x[${shadow[current]}]} ${shadow_y[${shadow[current]}]} ${frame_length[shadow]}

        # Check if shadow ate the star
        if [[ $new_pos == "G" ]]
        then
            # Place a new star.
            place_star 
            # The shadow's speed increses for each star one of them collects.
            ((shadow[speed]-=50))
        fi

        # Set the new shadow position.
        shadow_x[${shadow[current]}]=$new_x
        shadow_y[${shadow[current]}]=$new_y
    fi

    # Player looses if shadow eats him
    [[ ${level_mask[player_y-1]:player_x-1:1} == "B" && $invincible -eq 0 ]] && you_loose

    # Draw the shadow to the screen.
    printf "\e[${color_hash[shadow]}m\e[${shadow_y[${shadow[current]}]};${shadow_x[${shadow[current]}]}H${animation[shadow]:current_frame[shadow]:1}\e[m"
}
 
function main ()
{
    # Initialize game
    init
    load_level

    # The escape code.
    esc=`printf "\e"`

    # A variable used to time the speed of the character animations.
    char_timer=$(timer)

    # Animation speed.
    anim_speed=200

    # Constant to multiply timer by.
    SPEED_CONST=1000000


    # Main loop
    # Loop until player hits escape or 'q'.
    while [[ $char != $esc && $char != 'q' ]]
    do
        # Read a value from the keyboard.
        read char

        # Check what player wants to do
        case $char in
            "e" | "E")
                # The player cheats to win.
                you_win
                ;;
            "r" | "R")
                # Reload the level.
                load_level 
                ;;
            "*" ) place_star ;;
            "t" | "T")
                # Redraw the level and star.
                draw_level ${level[current]} ${level[draw_mode]}
                place_star
                ;;
            "p" | "P")
                # Pause the game.
                char=
                # Loop until the user presses 'p' or 'P' again.
                while [[ $char != "p" && $char != "P" ]]
                do
                    read char
                done
                ;;
            "g" | "G")
                # The player cheats and becomes invincible.
                invincible=$((!invincible))
                ;;
            "z" | "Z")
                # The player cheats and freezes all the shadows.
                if [[ -z ${shadow[frozen]} ]]
                then
                    shadow[frozen]=${shadow[total]}
                    shadow[total]=0
                else
                    shadow[total]=${shadow[frozen]}
                    shadow[frozen]=
                fi
                ;;
            "w" | "W")
                # Cheat to warp to a different level.

                # The character grabbed from the keyboard.
                char=
                # The new level number.
                level_num=
                
                # Loop until a 'd' is pressed.
                while [[ $char != "d" ]]
                do
                    # Grab the next character.
                    read char
                    case $char in
                        # If a number is pressed append it to the previous
                        # number to build the level number to warp to.
                        [[:digit:]]) level_num=$level_num$char ;;
                    esac
                done

                # Warp to the given level if it is valid.
                if [[ -n $level_num ]]
                then
                    if [[ $level_num -gt 0 ]]
                    then
                        level[current]=$level_num
                        load_level
                    fi
                fi
                ;;
            "[A" | "8" | "k")
                # Move the player up.
                move_player 0 -1
                # The up animation.
                animation[player]="V!"
                ;;
            "[B" | "2" | "j")
                # Move the player down.
                move_player 0 1
                # The down animation.
                animation[player]="A!"
                ;;
            "[C" | "6" | "l")
                # Move the player right.
                move_player 1 0 
                # The  right animation.
                animation[player]="<-"
                ;;
            "[D" | "4" | "h")
                # Move the player left.
                move_player -1 0
                # The left animation.
                animation[player]=">-"
                ;;
            "[1~" | "7" | "a")
                # Move the player left and up.
                move_player  -1 -1
                # The left and up animation.
                animation[player]="V!>-"
                ;;
            "[5~" | "9" | "s")
                # Move the player right and up.
                move_player 1 -1
                # The right and up animation.
                animation[player]="V!<-"
                ;;
            "[4~" | "1" | "d")
                # Move the player left and down.
                move_player -1 1
                # The left and down animation.
                animation[player]="A!>-"
                ;;
            "[6~" | "3" | "f")
                # Move the player right and down.
                move_player 1 1
                # The right and down animation.
                animation[player]="A!<-"
                ;;
        esac

        # Draw the player and the star to the screen.
        printf "\e[${color_hash[player]}m\e[${player_y};${player_x}H${animation[player]:current_frame[player]:frame_length[player]}\e[m"
        printf "\e[${color_hash[stars]}m\e[${stars[y]};${stars[x]}H${animation[stars]:current_frame[stars]:frame_length[stars]}\e[m"

        # Limit the shadows speed to (50-1000).
        if [[ ${shadow[speed]} -gt 1000 ]]
        then
            shadow[speed]=1000
        elif [[ ${shadow[speed]} -lt 50 ]]
        then
            shadow[speed]=50
        fi

        # Move shadow
        if [[ $(($(timer) - ${shadow[timer]})) -ge $((${shadow[speed]} * $SPEED_CONST)) && ${shadow[total]} -gt 0 ]]
        then
            # Chase player
            shadow_x_dir=0
            shadow_y_dir=0
            [[ ${shadow_x[${shadow[current]}]} -lt $player_x ]] && shadow_x_dir=1
            [[ ${shadow_x[${shadow[current]}]} -gt $player_x ]] && shadow_x_dir=-1
            [[ ${shadow_y[${shadow[current]}]} -lt $player_y ]] && shadow_y_dir=1
            [[ ${shadow_y[${shadow[current]}]} -gt $player_y ]] && shadow_y_dir=-1
            move_shadow $shadow_x_dir $shadow_y_dir
            shadow[current]=$(((shadow[current]+=1) % ${shadow[total]}))

            # Reset the shadow timer.
            [[ ${shadow[current]} -eq 0 ]] && shadow[timer]=$(timer)
        fi 

        # Animate characters
        if [[ $(($(timer) - $char_timer)) -ge $(($anim_speed * $SPEED_CONST)) ]]
        then
            # Put the next frame of the animation in the buffer.
            current_frame[shadow]=$(((current_frame[shadow]+1)%${#animation[shadow]}))
            current_frame[player]=$(((current_frame[player]+1)%${#animation[player]}))
            current_frame[stars]=$(((current_frame[stars]+1)%${#animation[stars]}))

            # reset animation timer
            char_timer=$(timer)
        fi
    done
}

# Only run if the script is run by itself.
[[ $0 =~ "shadow.bash" ]] && main

# Exit
