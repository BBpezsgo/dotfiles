#!/bin/sh

# Thank you <3 https://github.com/philj56/tofi/issues/102

list=$(unipicker --list)  # Original list for reuse in lookup
trimmed=$(printf "%s" "$list" |  cut -d" " -f1)  # List without leading numbers
index=$(printf "%s" "$list" | tofi --print-index=true)
if [ -n "$index" ]; then
	# Use index to find correct line in original list
	printf "%s" "$trimmed" | awk "NR==$index {print; quit}" | wl-copy
fi
