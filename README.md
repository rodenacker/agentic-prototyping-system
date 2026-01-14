# Prototyping Framework Agents

A structured, agent-based system for creating consistent, defensible prototypes through coordinated AI workflows.

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

## Detailed Workflow

The [Project Orchestration Agent](.claude/agents/project-orchestration-agent.md) coordinates five specialized agents through a two-phase workflow:

### Phase 1: Project Foundation (One-Time Setup)

Complete these steps once at the beginning of the project:

#### 1. Business Requirements Gathering
**Agent**: [Business Requirements Agent](.claude/agents/business-requirements-agent.md)

The agent will:
- Request your organization's website URL and analyze it
- Ask for any project briefs or meeting notes (optional)
- Conduct sequential Q&A to clarify business intent and project purpose
- Generate a business requirements document in `docs/project-docs/`

**What you'll answer:**
- Business problem and objective
- Target users and their needs
- Organizational value and success criteria
- Constraints and scope boundaries

**Output**: `docs/project-docs/business-requirements.md`

**User Action Required**: Review and approve the document before proceeding

#### 2. Design Token Extraction
**Agent**: [Style Token Extraction Agent](.claude/agents/style-token-extraction-agent.md)

The agent will:
- Extract colors, fonts, and brand assets from your website
- Create CSS design tokens (CSS variables)
- Set up shared CSS foundation in `prototypes/shared/styles/`

**Output**: `prototypes/shared/styles/design-tokens.css`

#### 3. Application Setup
**Agent**: [Project Setup Agent](.claude/agents/project-docs-agent.md)

The agent will:
- Initialize React application in `prototypes/` folder
- Create shared systems structure (`components/`, `styles/`, `assets/`, `utils/`)
- Set up required core UI components (confirmation dialog, toast notifications)
- Configure development environment and build tools
- Generate landing page with empty state placeholder

**Output**:
- React application structure
- Shared component foundation
- Landing page at `prototypes/src/App.jsx`
- Working development environment

**User Action Required**: Manually start dev server (`npm start`) to verify setup

**Completion Criteria**:
- ✅ Business requirements documented
- ✅ Design tokens extracted and stored
- ✅ Development environment ready
- ✅ Landing page created and verified

---

### Phase 2: Prototype Cycle (Repeat Per Prototype)

Complete these steps for each prototype you create:

#### 1. Brief & Wireframes Review
**Agent**: [Requirements Research Agent](.claude/agents/requirements-research-agent.md)

**Before starting**: Create a brief file at `docs/[prototype-name]/brief.md`

The agent will:
- Read your brief document completely
- Review any wireframes you provide
- Identify what's unclear or missing
- Prepare focused clarification questions

#### 2. Requirements Q&A

The agent will:
- Invoke the requirement clarification skill
- Ask sequential questions to eliminate ambiguity
- Clarify prototype-specific requirements needed for implementation

**What you'll answer:**
- Problem to be validated
- Primary user and core tasks
- Success criteria and required data
- Workflow boundaries and constraints
- Explicit non-goals

#### 3. Requirements Documentation

The agent will:
- Create prototype requirements document
- Include acceptance criteria and documented assumptions
- Save to `docs/[prototype-name]/requirements.md`

**Output**: `docs/[prototype-name]/requirements.md`

**User Action Required**: Review and approve the document before proceeding

#### 4. Prototype Implementation
**Agent**: [Prototype Agent](.claude/agents/prototype-agent.md)

The agent will:
- Read all requirement documents and create implementation checklist
- Review existing shared components for reuse
- Create new shared components in `prototypes/shared/components/` as needed
- Build prototype structure in `prototypes/[prototype-name]/`
- Implement UI screens using shared components and styling
- Assemble screens into fully clickable prototype
- **Update landing page** with link to new prototype
- Run comprehensive code review checklist

**Output**:
- Prototype code in `prototypes/[prototype-name]/`
- New shared components (if created)
- Updated landing page with prototype link

**User Action Required**:
1. Start dev server (if not running): `npm start`
2. Test the prototype thoroughly
3. Provide feedback or type 'approve' to complete

#### 5. Validation & Revision

If issues are found:
- Report specific issues to the agent
- Agent will fix issues in tightly scoped changes
- Agent will re-run code review checklist
- Test again until approved

**Focus**: One round of feedback and fixes per prototype

---

### Managed Skills

Agents may invoke skills during their workflow:

**requirement-clarification**
- Purpose: Sequential Q&A to eliminate requirement ambiguity
- Used by: Business Requirements Agent, Requirements Research Agent
- Automatically invoked when needed during agent workflow

### Key Rules

- **Strict ordering**: No agent starts before its dependencies are complete
- **One agent at a time**: No interleaving of agent conversations
- **Document handoffs**: Each agent's output becomes immutable input for the next
- **No shortcuts**: Foundation phase must be completed before prototype work begins
- **User approvals**: You must explicitly approve requirement documents before implementation
- **Manual server start**: Dev server must always be started manually by you (never automatically)

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
