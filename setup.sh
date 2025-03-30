#!/bin/bash

echo "🔹 Setting Up The JOB TRACKING PROJECT."

# Check if Python3 is installed
if ! command -v python3 &> /dev/null
then
    echo "❌ Python3 is not installed. Please install it first."
    exit 1
fi

# Check if virtual environment exists
if [[ ! -d "venv" ]]
then
    echo "✅ Creating Virtual Environment..."
    python3 -m venv venv
else
    echo "✅ Virtual Environment Already Exists."
fi

# Ensure the virtual environment activation script exists
if [[ -f "venv/bin/activate" ]]; then
    # Activate the virtual environment
    source venv/bin/activate
else
    echo "❌ Virtual environment activation failed."
    exit 1
fi

# Install Flask only if requirements.txt does not exist
if [[ ! -f "requirements.txt" ]]; then
    echo "✅ Installing Flask..."
    pip install flask
    pip freeze > requirements.txt
else
    echo "✅ Flask already installed."
fi

echo "✅ Setup Complete! You can now run the project using ./run.sh"
