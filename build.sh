#!/bin/bash
# Build script for Render deployment
echo "Current directory: $(pwd)"
echo "Files in current directory:"
ls -la

# Find the actual package.json location
if [ -f "package.json" ]; then
    echo "Found package.json in current directory"
    npm install && npm run build
elif [ -f "../package.json" ]; then
    echo "Found package.json in parent directory"
    cd .. && npm install && npm run build
else
    echo "Searching for package.json..."
    find . -name "package.json" -not -path "./node_modules/*" | head -1
    exit 1
fi