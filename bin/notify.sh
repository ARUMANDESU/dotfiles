#!/bin/bash

# Function to play sound based on success/failure
play_sound() {
    if [ $1 -eq 0 ]; then
        paplay --volume=150000  /usr/share/sounds/freedesktop/stereo/complete.oga
    else
        paplay --volume=150000 /usr/share/sounds/freedesktop/stereo/dialog-error.oga
    fi
}

# Check if command is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <command>"
    exit 1
fi

# Execute the command and store exit code
"$@"
exit_code=$?

# Play appropriate sound
play_sound $exit_code

# Exit with the same code as the command
exit $exit_code
