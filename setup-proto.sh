#!/bin/bash

# 1. Configuration
REPO_URL="https://github.com/rodenacker/agent-prototyping-system"
TARGET_DIR="agent-prototyping-system"
MODEL="claude-4-5-opus"

echo "🚀 Initializing Agent Prototyping System..."

# 2. Clone the repository if it doesn't exist
if [ ! -d "$TARGET_DIR" ]; then
    echo "📂 Cloning repository..."
    git clone "$REPO_URL"
else
    echo "✅ Directory '$TARGET_DIR' already exists. Skipping clone."
fi

# 3. Enter the directory
cd "$TARGET_DIR" || exit

# 4. Launch Claude Code with Opus 4.5
echo "🤖 Starting Claude Code with $MODEL..."
claude --model "$MODEL"