#!/bin/zsh
# Replace all occurrences of a string in a file with another.
#
# Usage: replace_hash.sh <oldhash> <newhash>
#
# Example: replace_hash.sh 1234567890abcdef 0987654321fedcba
#
# Author: Marco Hoffmann
#
test $# -ne 2 && echo "Usage: replace_hash.sh <oldhash> <newhash>" && exit 1
old_hash=${1}
new_hash=${2}

for file in $(grep -RHl ${old_hash} .); do
		echo "will change ${file}"
		sed -i "s/${old_hash}/${new_hash}/g" ${file}
done
