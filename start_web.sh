#!/bin/bash

# ForkMonkey Web Interface Launcher

echo "🐵 Starting ForkMonkey Web Interface..."
echo ""

# Check if monkey exists
if [ ! -f "monkey_data/dna.json" ]; then
    echo "⚠️  No monkey found! Initializing..."
    python src/cli.py init
    echo ""
fi

# Start web server
echo "🚀 Starting web server..."
python web/serve.py
