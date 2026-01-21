#!/bin/bash
# ClaudeWatch - Setup Script

set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== ClaudeWatch Setup ==="

# Check Python 3
if ! command -v python3 &> /dev/null; then
    echo "Error: Python 3 required. Install via: brew install python3"
    exit 1
fi

# Create venv
python3 -m venv "$SCRIPT_DIR/venv"
source "$SCRIPT_DIR/venv/bin/activate"

# Install deps
pip install --quiet --upgrade pip
pip install --quiet -r "$SCRIPT_DIR/requirements.txt"

chmod +x "$SCRIPT_DIR/claude_usage.py"

echo ""
echo "Setup complete!"
echo "Run: $SCRIPT_DIR/venv/bin/python $SCRIPT_DIR/claude_usage.py"
