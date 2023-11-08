#!/bin/bash
chmod +x script.sh
TAG="p1.0"
FILE="main.py"

# Get the commit ID of the latest commit that modified main.py and has the specified tag
COMMIT_ID=$(git log -n 1 --pretty=format:"%H" --grep="$TAG" -- $FILE)

echo "Commit ID for $FILE with tag $TAG: $COMMIT_ID"
