#!/bin/bash

# Script to find and analyze overfull hbox warnings in LaTeX log files
# Usage: ./find-overfull.sh [logfile]

LOGFILE=${1:-"example.log"}

if [ ! -f "$LOGFILE" ]; then
    echo "Log file $LOGFILE not found!"
    echo "Usage: $0 [logfile]"
    exit 1
fi

echo "=== OVERFULL HBOX ANALYSIS ==="
echo "Analyzing: $LOGFILE"
echo

# Count total overfull hboxes
TOTAL=$(grep -c "Overfull.*hbox" "$LOGFILE")
echo "Total overfull hboxes found: $TOTAL"
echo

if [ $TOTAL -eq 0 ]; then
    echo "No overfull hboxes found!"
    exit 0
fi

echo "=== DETAILED OVERFULL HBOX LOCATIONS ==="
echo

# Extract overfull hbox warnings with context
grep -n -A2 -B1 "Overfull.*hbox" "$LOGFILE" | while IFS= read -r line; do
    if [[ $line =~ ^[0-9]+.*Overfull ]]; then
        echo "----------------------------------------"
        echo "$line"
    elif [[ $line =~ lines.*-- ]]; then
        # Extract line numbers from LaTeX messages
        echo "$line"
    elif [[ $line =~ ^[0-9]+- ]]; then
        echo "$line"
    fi
done

echo
echo "=== QUICK ANALYSIS ==="

# Analyze common patterns
echo "Most problematic widths (pt overfull):"
grep "Overfull.*hbox" "$LOGFILE" | sed 's/.*(\([0-9.]*\)pt too wide).*/\1/' | sort -nr | head -5

echo
echo "Lines mentioned in overfull warnings:"
grep -o "lines [0-9]*--[0-9]*" "$LOGFILE" | sort | uniq -c | sort -nr

echo
echo "=== SUGGESTIONS ==="
echo "1. Uncomment \\overfullrule=5pt in your .tex file to see black bars"
echo "2. Check the line numbers mentioned above"
echo "3. Common fixes:"
echo "   - Use \\sloppy before problematic frames"
echo "   - Break long URLs with \\url{} or \\href{}{}"
echo "   - Adjust column widths in tables"
echo "   - Use \\allowbreak in long expressions"
echo "   - Consider \\emergencystretch=1em for entire document" 