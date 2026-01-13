# Prototyping Framework Agents

A structured, agent-based system for creating consistent, defensible prototypes through coordinated AI workflows.

## Purpose

This framework provides a systematic approach to prototype development by orchestrating specialized AI agents, each responsible for a specific phase of the prototyping process. The goal is to ensure:

- **Consistency**: Shared design tokens and business requirements across all prototypes
- **Quality**: Structured workflows that prevent shortcuts and ensure completeness
- **Defensibility**: Clear documentation and rationale at every step
- **Efficiency**: Reusable foundation work across multiple prototypes

## How It Works

The framework uses a **two-phase approach**:

### Phase 1: Project Foundation (Once Per Project)

Before any prototype work begins, the system establishes a shared foundation:

1. **Business Requirements Gathering** - Clarifies customer needs, business intent, and project purpose
2. **Style Token Extraction** - Creates shared CSS design tokens for visual consistency
3. **Project Setup** - Initializes the React application, creates shared systems structure, and generates the landing page

This foundation is created once and reused across all prototypes in the project.

### Phase 2: Prototype Cycle (Repeat Per Prototype)

For each individual prototype:

1. **Requirements Research** - Clarifies prototype-specific requirements
2. **Prototype Generation** - Builds the prototype using the foundation and specific requirements

Each prototype cycle is independent, but all prototypes share the same foundational elements.

## Workflow

The [Project Orchestration Agent](.claude/agents/project-orchestration-agent.md) coordinates five specialized agents:

1. **[Business Requirements Agent](.claude/agents/business-requirements-agent.md)** - Gathers business context
2. **[Style Token Extraction Agent](.claude/agents/style-token-extraction-agent.md)** - Extracts design tokens
3. **[Project Setup Agent](.claude/agents/project-setup-agent.md)** - Initializes React app and creates landing page
4. **[Requirements Research Agent](.claude/agents/requirements-research-agent.md)** - Clarifies prototype requirements
5. **[Prototype Agent](.claude/agents/prototype-agent.md)** - Generates the prototype

### Key Rules

- **Strict ordering**: No agent starts before its dependencies are complete
- **One agent at a time**: No interleaving of agent conversations
- **Document handoffs**: Each agent's output becomes immutable input for the next
- **No shortcuts**: Foundation phase must be completed before prototype work begins

## Getting Started

### Step 1: Run the Setup Script

Execute the setup script from anywhere:

```powershell
.\setup-proto.ps1
```

The script will:
- Prompt you for a project folder name
- Create the project folder
- Clone the `agent-prototyping-system` repository into the folder
- Display next steps for starting the agent system

### Step 2: Navigate and Start Claude Code

Navigate to your new project folder and start Claude Code:

```powershell
cd your-project-folder-name
claude --model claude-4-5-opus
```

### Step 3: Start the Project Orchestration Agent

Once Claude Code is running, load the Project Orchestration Agent:

```
/agentic .claude/agents/project-orchestration-agent.md
```

The orchestrator will guide you through the workflow, starting with Phase 1 (Project Foundation).

### What to Expect

The orchestrator will:
1. Ask targeted questions to initiate the business requirements agent
2. Guide you through style token extraction
3. Help you create as many prototypes as needed, each following the structured cycle
4. Ensure all dependencies are met before proceeding to the next phase

## Project Structure

```
.
├── .claude/
│   └── agents/               # Agent definition files
│       ├── project-orchestration-agent.md
│       ├── business-requirements-agent.md
│       ├── style-token-extraction-agent.md
│       ├── requirements-research-agent.md
│       └── prototype-agent.md
├── docs/                     # Documentation and guidelines
├── setup-proto.ps1          # Setup script
└── README.md               # This file
```

## Requirements

- [Claude Code CLI](https://claude.com/claude-code)
- PowerShell (for running setup-proto.ps1)

## Notes

- The orchestrator will stop if you try to skip steps or if dependencies are missing
- Foundation work (Phase 1) is done once per project
- Prototype cycles (Phase 2) can be repeated independently for each prototype
- Each agent has a specific purpose and cannot substitute for another
