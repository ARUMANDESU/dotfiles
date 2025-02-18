#!/usr/bin/env bash
# This script captures a screenshot region, extracts text using Tesseract OCR,
# and copies the extracted text into the clipboard using wl-copy.
#
# Requirements: grim, slurp, tesseract, and wl-copy.

set -e

# Check if required commands exist.
for cmd in grim slurp tesseract wl-copy; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "Error: $cmd is not installed." >&2
        exit 1
    fi
done

# Create a temporary file for the screenshot.
temp_file=$(mktemp --suffix=.png)

# Capture a screenshot of a selected region.
grim -g "$(slurp)" "$temp_file"

# Use Tesseract to extract text from the screenshot.
ocr_text=$(tesseract "$temp_file" stdout)

# Copy the extracted text into the clipboard.
echo "$ocr_text" | wl-copy

# Output the extracted text.
echo "Extracted text (copied to clipboard):"
echo "$ocr_text"

# Clean up the temporary file.
rm "$temp_file"

