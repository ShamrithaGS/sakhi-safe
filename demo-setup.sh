#!/bin/bash

echo "🚀 Sakhi-Safe Quick Demo Setup"
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 not found. Please install Python 3.9+"
    exit 1
fi

echo "✅ Python found: $(python3 --version)"
echo ""

# Install ML Engine dependencies
echo "📦 Installing ML Engine dependencies..."
cd ml_engine
pip install -r requirements.txt
echo "✅ Dependencies installed"
echo ""

# Start ML Engine
echo "🚀 Starting ML Engine on http://localhost:5000..."
echo "Press Ctrl+C to stop"
echo ""
python app.py
