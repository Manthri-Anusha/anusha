#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status

# Installing Python dependencies
echo "📦 Installing Python dependencies..."
pip install --no-cache-dir -r requirements.txt

# Create a test directory if it doesn't exist
echo "📂 Setting up test directory..."
mkdir -p tests

# Verify pytest installation
echo "📈 Verifying pytest installation..."
pytest --version
