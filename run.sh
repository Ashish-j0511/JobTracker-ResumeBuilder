#!/bin/bash

echo "🚀 Starting the Job Tracker Project"

# Check if virtual environment exists
if [[ ! -d "venv" ]]; then
    echo "❌ Virtual environment not found! Run ./setup.sh first."
    exit 1
fi

# Activate the virtual environment
source venv/bin/activate

# Check if app.py exists
if [[ ! -f "app.py" ]]; then
    echo "❌ app.py not found! Make sure your Flask app exists."
    deactivate
    exit 1
fi

# Run Flask app
echo "✅ Running Flask app..."
python app.py
