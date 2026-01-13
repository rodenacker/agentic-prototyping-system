# 1. Configuration
$RepoUrl = "https://github.com/rodenacker/agent-prototyping-system"
$Model = "claude-4-5-opus"

Write-Host "Initializing Agent Prototyping System..." -ForegroundColor Cyan

# 2. Check if directory is empty or already initialized
$HasClaudeDir = Test-Path -Path ".claude"
$IsEmpty = -not (Get-ChildItem -Path . -Force | Where-Object { $_.Name -ne '.git' })

if (-not $HasClaudeDir -and $IsEmpty) {
    Write-Host "Cloning repository into current directory..." -ForegroundColor Yellow
    git clone $RepoUrl .
} elseif ($HasClaudeDir) {
    Write-Host "Project already initialized. Skipping clone." -ForegroundColor Green
} else {
    Write-Host "Directory is not empty. Please run this script in an empty directory or one with existing agent files." -ForegroundColor Red
    exit 1
}

# 3. Launch Claude Code with Opus 4.5
Write-Host "Starting Claude Code with $Model..." -ForegroundColor Magenta
claude --model $Model