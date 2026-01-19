# /orchestrate

## Initialization Check

Before invoking the orchestrator, check if the Claude Code project has been initialized:

1. **Check for `.claude/project.json`** - This file is created by the Claude Code built-in `/init` command
2. **If the file does NOT exist:**
   - Inform the user: "This project hasn't been initialized yet. Running `/init` first..."
   - Execute the Claude Code built-in `/init` command
   - Wait for initialization to complete
3. **After initialization is confirmed:**
   - Invoke the Project Orchestration Agent defined in `project-orchestration.agent.md`

## Command Execution

If project is already initialized (`.claude/project.json` exists), directly invoke the Project Orchestration Agent defined in `project-orchestration.agent.md`