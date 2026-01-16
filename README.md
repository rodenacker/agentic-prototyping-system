# Prototyping Framework

A structured, agent-based system for creating consistent, defensible prototypes through coordinated AI workflows.

## Table of Contents
- [Quick Start](#quick-start)
- [Purpose](#purpose)
- [How It Works](#how-it-works)
  - [Modularization: Breaking Your System Into Prototypes](#modularization-breaking-your-system-into-prototypes)
- [Getting Started](#getting-started)
- [Detailed Workflow](#detailed-workflow)
  - [Phase 1: Project Foundation](#phase-1-project-foundation-one-time-setup)
  - [Phase 2: Prototype Cycle](#phase-2-prototype-cycle-repeat-per-prototype)
- [Managed Skills](#managed-skills)
- [Key Rules](#key-rules)
- [Project Structure](#project-structure)
- [Requirements](#requirements)
- [Notes](#notes)

## Quick Start

1. **Run setup script:**
   ```powershell
   .\setup-proto.ps1
   ```

2. **Navigate to project and start Claude Code:**
   ```powershell
   cd your-project-folder-name
   claude --model claude-4-5-opus
   ```

3. **Start the orchestrator:**
   ```
   /project-orchestrator
   ```

The orchestrator will guide you through Phase 1 (Project Foundation) and then help you create prototypes through Phase 2 cycles.

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

### Modularization: Breaking Your System Into Prototypes

**IMPORTANT**: This framework is designed for creating **multiple small, focused prototypes**, not one massive prototype of your entire system.

**When to Modularize**: After Phase 1 is complete (business requirements, design tokens, and project setup), but before starting any prototype cycles, you should break your system into smaller modules or features to prototype.

**Why Small Modules?**
- **Faster iteration**: Small prototypes can be generated and tested quickly
- **More experimentation**: Test multiple approaches to the same problem
- **Better feedback**: Focused prototypes are easier to evaluate and critique
- **Lower risk**: Failed experiments are smaller and cheaper
- **Clearer decisions**: Each prototype validates a specific hypothesis or design choice

**How to Modularize**:
Think about your system as a collection of independent features or workflows:
- Individual user tasks or journeys
- Specific features or capabilities
- Critical interaction patterns
- Alternative approaches to solve the same problem
- High-risk or uncertain design decisions

**Examples**:
- ❌ Don't: "Customer portal prototype" (too broad)
- ✅ Do: "Invoice approval workflow", "Profile settings page", "Dashboard overview"

Each prototype should be small enough to build, review, and test in a focused session.

### Phase 2: Prototype Cycle (Repeat Per Prototype)

For each individual prototype:

1. **Requirements Research** - Clarifies prototype-specific requirements
2. **Prototype Design** - Creates design brief with user stories, views, and task flows
3. **Prototype Implementation** - Builds the prototype using the foundation and specifications
4. **Code Review & Compliance** - Strict review gate with automated fix orchestration
5. **Validation & Revision** - Optional refinement based on user testing

Each prototype cycle is independent, but all prototypes share the same foundational elements.

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

### Step 2: Navigate and Start Claude Code

Navigate to your new project folder and start Claude Code:

```powershell
cd your-project-folder-name
claude --model claude-4-5-opus
```

### Step 3: Start the Project Orchestration Agent

Once Claude Code is running, invoke the Project Orchestration Agent using the slash command:

```
/project-orchestrator
```

The orchestrator will guide you through the workflow, starting with Phase 1 (Project Foundation).

### Alternative: Run Individual Agent Commands

You can also invoke specific agents directly using their slash commands:

**Phase 1 Commands:**
- `/project-requirements` - Business requirements gathering
- `/project-style-token` - Design token extraction
- `/project-setup` - Application setup

**Phase 2 Commands:**
- `/prototype-requirement` - Prototype-specific requirements
- `/prototype-design` - Prototype design brief
- `/prototype` - Prototype implementation
- `/code-review` - Code review & compliance gate

**Utility Commands:**
- `/requirements-document-review` - Review requirements documents

### What to Expect

The orchestrator will:
1. Check project state and determine the next required step
2. Guide you through business requirements gathering
3. Coordinate style token extraction and project setup
4. Help you create as many prototypes as needed, each following the structured cycle
5. Ensure all dependencies are met before proceeding to the next phase

## Detailed Workflow

The [Project Orchestration Agent](.claude/agents/project-orchestration-agent.md) coordinates specialized agents through a two-phase workflow defined in [prototype-project.workflow.json](.claude/workflows/prototype-project.workflow.json):

### Phase 1: Project Foundation (One-Time Setup)

Complete these steps once at the beginning of the project:

#### 1. Business Requirements Gathering
**Agent**: [Project Requirements Agent](.claude/agents/project-requirements-agent.md)
**Command**: `/project-requirements`

The agent will:
- Request your organization's website URL and analyze it
- Ask for any project briefs or meeting notes (optional)
- Invoke the requirement clarification skill for sequential Q&A
- Clarify business intent and project purpose
- Invoke the requirements-review skill to validate the document
- Generate a business requirements document in `docs/project-docs/`

**What you'll answer:**
- Business problem and objective
- Target users and their needs
- Organizational value and success criteria
- Constraints and scope boundaries

**Output**: `docs/project-docs/business-requirements.md`

**User Action Required**: Review and approve the document before proceeding

#### 2. Design Token Extraction
**Agent**: [Project Style Token Agent](.claude/agents/project-style-token-agent.md)
**Command**: `/project-style-token`

The agent will:
- Extract colors, fonts, and brand assets from your website
- Create CSS design tokens (CSS variables)
- Set up shared CSS foundation in `prototypes/shared/styles/`

**Output**: `prototypes/shared/styles/design-tokens.css`

#### 3. Application Setup
**Agent**: [Project Setup Agent](.claude/agents/project-setup-agent.md)
**Command**: `/project-setup`

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

#### 1. Prototype Requirements Research
**Agent**: [Prototype Requirements Agent](.claude/agents/prototype-requirements-agent.md)
**Command**: `/prototype-requirement`

**Before starting**: Create a brief file at `docs/[prototype-name]/brief.md`

The agent will:
- Read your brief document completely
- Review any wireframes you provide
- Identify what's unclear or missing
- Prepare focused clarification questions

The agent will:
- Read your brief document and wireframes
- Identify gaps and unclear requirements
- Invoke the requirement clarification skill for sequential Q&A
- Ask focused questions to eliminate ambiguity
- Invoke the requirements-review skill to validate the document
- Create prototype requirements document

**What you'll answer:**
- Problem to be validated
- Primary user and core tasks
- Success criteria and required data
- Workflow boundaries and constraints
- Explicit non-goals

**Output**: `docs/[prototype-name]/prototype-requirements.md`

**User Action Required**: Review and approve the document before proceeding

#### 2. Prototype Design
**Agent**: [Prototype Design Agent](.claude/agents/prototype-design-agent.md)
**Command**: `/prototype-design`

The agent will:
- Review prototype requirements and business goals
- Clarify prototype purpose and relationship to business objectives
- Define user tasks and document user stories
- Define views, UI patterns, and task flows
- Recommend appropriate UI patterns and controls
- Explore architecture alternatives
- Define MVP scope and boundaries
- Create design brief document

**Output**: `docs/[prototype-name]/prototype-design-brief.md`

**User Action Required**: Review and approve the design brief before proceeding

#### 3. Prototype Implementation
**Agent**: [Prototype Agent](.claude/agents/prototype-agent.md)
**Command**: `/prototype`

The agent will:
- Read requirements document and design brief
- Create implementation checklist
- Review existing shared components for reuse
- Create new shared components in `prototypes/shared/components/` as needed
- Build prototype structure in `prototypes/[prototype-name]/`
- Implement UI screens using shared components and styling
- Assemble screens into fully clickable prototype
- **Update landing page** with link to new prototype
- Run comprehensive self-review checklist

**Output**:
- Prototype code in `prototypes/[prototype-name]/`
- New shared components (if created)
- Updated landing page with prototype link

#### 4. Code Review & Compliance Gate
**Agent**: [Code Review Agent](.claude/agents/code-review-agent.md)
**Command**: `/code-review`

The agent will:
- Review code against all specifications and rules
- Evaluate 6 mandatory review dimensions:
  - Specification Adherence
  - Rule Compliance (CSS, components, architecture)
  - Architectural Integrity
  - Code Quality
  - Safety & Risk
  - Maintainability
- Produce verdict: Acceptable / Conditionally Acceptable / Unacceptable
- Generate Rule-by-Rule Compliance Table
- Create Problem List with IDs (if issues found)
- **Orchestrate fixes**: Invoke prototype agent with Problem List
- Verify fixes and produce final verdict

**Output**:
- Code review report with verdict
- Problem List (if issues found)
- Rule-by-Rule Compliance Table

**User Action Required**:
1. Start dev server (if not running): `npm start`
2. Test the prototype thoroughly
3. Provide feedback or type 'approve' to complete

#### 5. Validation & Revision (Optional)

If issues are found during user testing:
- Report specific issues to the orchestrator
- Agent will fix issues in tightly scoped changes
- Test again until approved

**Focus**: Address user feedback after passing code review gate

---

### Managed Skills

Agents invoke skills during their workflow:

**requirement-clarification**
- Purpose: Sequential Q&A to eliminate requirement ambiguity
- Used by: Project Requirements Agent, Prototype Requirements Agent
- Timing: Before creating requirement documents
- Automatically invoked by agents

**requirements-review**
- Purpose: Review requirements documents against framework rules and guidance
- Used by: Project Requirements Agent, Prototype Requirements Agent
- Timing: After creating requirement documents, before presenting to user
- Automatically invoked by agents

Users can also invoke skills directly:
- `/requirements-document-review` - Review any requirements document

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
│   ├── agents/                         # Agent definition files
│   │   ├── project-orchestration-agent.md
│   │   ├── project-requirements-agent.md
│   │   ├── project-style-token-agent.md
│   │   ├── project-setup-agent.md
│   │   ├── prototype-requirements-agent.md
│   │   ├── prototype-design-agent.md
│   │   ├── prototype-agent.md
│   │   └── code-review-agent.md
│   ├── commands/                       # Slash command files
│   │   ├── project-orchestrator.md
│   │   ├── project-requirements.md
│   │   ├── project-style-token.md
│   │   ├── project-setup.md
│   │   ├── prototype-requirement.md
│   │   ├── prototype-design.md
│   │   ├── prototype.md
│   │   ├── code-review.md
│   │   └── requirements-document-review.md
│   ├── skills/                         # Reusable skill definitions
│   │   ├── requirement-clarification-skill.md
│   │   └── requirements-review-skill.md
│   └── workflows/                      # Workflow definitions
│       └── prototype-project.workflow.json
├── docs/                               # Documentation and guidelines
├── setup-proto.ps1                     # Setup script
└── README.md                           # This file
```

## Requirements

- [Claude Code CLI](https://claude.com/claude-code)
- PowerShell (for running setup-proto.ps1)

## Notes

- The orchestrator will stop if you try to skip steps or if dependencies are missing
- Foundation work (Phase 1) is done once per project
- Prototype cycles (Phase 2) can be repeated independently for each prototype
- Each agent has a specific purpose and cannot substitute for another
