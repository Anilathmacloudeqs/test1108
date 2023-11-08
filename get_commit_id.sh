#!/bin/bash
chmod +x get_commit_id.sh

TAG="p1.0"
FILE="main.py"

# Debug information
echo "Current directory: $(pwd)"
echo "List files in the current directory: $(ls)"

# Check the Git configuration
echo "Git configuration: $(git config --list)"

# Get the commit ID of the latest commit that modified main.py and has the specified tag
COMMIT_ID=$(git log -n 1 --pretty=format:"%H" --grep="$TAG" -- $FILE)

echo "Commit ID for $FILE with tag $TAG: $COMMIT_ID"
