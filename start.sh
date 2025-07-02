#!/bin/bash
# Start script for Render deployment
echo "Starting PharmaCost Pro..."
echo "Current directory: $(pwd)"

# Find the correct directory with dist/index.js
if [ -f "dist/index.js" ]; then
    echo "Found dist/index.js in current directory"
    NODE_ENV=production node dist/index.js
elif [ -f "../dist/index.js" ]; then
    echo "Found dist/index.js in parent directory"
    cd .. && NODE_ENV=production node dist/index.js
else
    echo "Searching for dist/index.js..."
    find . -name "index.js" -path "*/dist/*" | head -1
    exit 1
fi