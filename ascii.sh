#!/bin/sh

# ASCII image generator
# Usage: ./ascii.sh <word>

# Function to check if a package is installed
package_installed() {
  apk info -e "$@" &> /dev/null
}

# Check if lolcat and figlet are installed
if ! package_installed lolcat || ! package_installed figlet; then
  echo "Installing lolcat and figlet..."

  # Check if testing repository is already added
  if ! grep -q "http://dl-cdn.alpinelinux.org/alpine/edge/testing" /etc/apk/repositories; then
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" | tee -a /etc/apk/repositories
    apk update
  fi

  # Install packages
  apk add lolcat figlet
fi

# Get the word
word="$1"

# Check if a word was provided
if [ -z "$word" ]; then
  echo "Please provide a word to generate ASCII art."
  exit 1
fi

# Generate ASCII art (without color codes) and Pipe the output to lolcat for colorization
figlet -f "banner" "$word" 2>/dev/null | lolcat
echo
