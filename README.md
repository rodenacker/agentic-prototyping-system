# Prototyping Framework

A structured, agent-based framework for creating consistent, defensible prototypes through coordinated AI workflows.

## Table of Contents
1. [Quick Start](#1-quick-start)
2. [Purpose](#2-purpose)
3. [How It Works](#3-how-it-works)
   1. [Design Philosophy](#31-design-philosophy)
   2. [Modularization](#32-modularization)
   3. [The Workflow](#33-the-workflow)
4. [Using The Framework](#4-using-the-framework)
   1. [Run the Setup Script](#41-run-the-setup-script)
   2. [Define The Project](#42-define-the-project)
   3. [Start Claude Code](#43-start-claude-code)
   4. [Invoke The Project Orchestration Agent](#44-invoke-the-project-orchestration-agent)
   5. [Identify Modules To Prototype](#45-identify-modules-to-prototype)
5. [Individual Agent Commands](#5-individual-agent-commands)
6. [Requirements](#6-requirements)

## 1. Quick Start

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
   /start
   ```

The orchestrator will guide you through Phase 1 (Project Foundation) and then help you create prototypes through Phase 2 cycles.

## 2. Purpose

This framework provides a systematic approach to prototype development by orchestrating specialized AI agents, each responsible for a specific phase of the prototyping process. The goal is to ensure:

- **Consistency**: Shared design tokens and business requirements across all prototypes
- **Quality**: Structured workflows that prevent shortcuts and ensure completeness
- **Defensibility**: Clear documentation and rationale at every step
- **Efficiency**: Reusable foundation work across multiple prototypes

## 3. How It Works

### 3.1 Design Philosophy

This framework is built on three core principles:

#### 1. Modular Complexity Management

Rather than building one massive prototype of your entire system, you create **many small, focused prototypes**—each representing a distinct module or feature.

**The result**: One landing page that links to multiple independent prototypes, each exploring a specific part of your system.

**Benefits**:
- Complex systems become manageable pieces
- Each module can be validated independently
- Failed experiments are isolated and low-cost
- Successful patterns can be identified and reused

#### 2. Clickable Over Abstract

Prototypes are **fully interactive, clickable experiences**, not wireframes, mockups, or static designs.

**The result**: Users can actually click through workflows, interact with controls, and experience the system tactically.

**Benefits**:
- Reveals usability issues that static designs miss
- Provides realistic user testing scenarios
- Builds confidence in design decisions through hands-on validation
- Creates shared understanding across stakeholders through concrete artifacts

#### 3. Rapid Iteration Cycles

Each prototype cycle is designed to be **fast and repeatable**, encouraging experimentation and learning.

**The result**: You can quickly test multiple approaches to the same problem, compare alternatives, and iterate based on feedback.

**Benefits**:
- Test risky ideas cheaply before committing
- Compare competing design solutions side-by-side
- Rapidly incorporate user feedback
- Build momentum through frequent, tangible progress

### 3.2 Modularization

**When to Modularize**: After Phase 1 is complete (business requirements, design tokens, and project setup), but before starting any prototype cycles, break your system into smaller modules.

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

### 3.3 The Workflow

The framework implements prototypes in a **two-phase approach**:

#### High-Level Overview

1. **Phase 1: Project Foundation** (run once)
   - Gather business requirements
   - Extract design tokens from your brand
   - Set up the React application and landing page
   - Code review foundation code (scaffolding, landing page)
   - Verify project structure compliance

2. **Phase 2: Prototype Cycle** (repeat for each module)
   - Research-to-Design → Implement → Code review → Validate
   - Verify project structure compliance
   - Each cycle produces a clickable prototype linked from the landing page

#### Detailed Workflow Visualization

**Phase 1: Project Foundation** (One-time setup)

```
Start: /start
         │
         ↓
┌────────────────────────────────────────────────────────────────┐
│ 1. Business Requirements Gathering                            │
│    Agent: project-requirements-agent                           │
│    Input: Website URL, optional project briefs/notes          │
│    Output: docs/project-docs/business-requirements.md         │
│    ✋ User approval required                                   │
└────────────────┬───────────────────────────────────────────────┘
                 ↓
┌────────────────────────────────────────────────────────────────┐
│ 2. Design Token Extraction                                    │
│    Agent: project-style-token-agent                           │
│    Input: Customer website                                     │
│    Output: prototypes/shared/styles/design-tokens.css         │
│    ✋ User approval required                                   │
└────────────────┬───────────────────────────────────────────────┘
                 ↓
┌────────────────────────────────────────────────────────────────┐
│ 3. Application Setup                                          │
│    Agent: project-setup-agent                                 │
│    Output: React app + shared components + landing page       │
│    👤 Manual action: Run npm run dev                          │
└────────────────┬───────────────────────────────────────────────┘
                 ↓
┌────────────────────────────────────────────────────────────────┐
│ 4. Code Review & Compliance Gate (Foundation)                 │
│    Agent: general-code-review-agent                           │
│    Reviews scaffolding, landing page, shared components       │
│    Note: No prototypes yet - reviews foundation code only     │
│    Produces Problem List if issues found                       │
│    Orchestrates fixes via project-setup-agent                  │
│    Re-reviews until verdict: Acceptable                        │
│    ✋ User approval required                                   │
└────────────────┬───────────────────────────────────────────────┘
                 ↓
┌────────────────────────────────────────────────────────────────┐
│ 5. Structure Cleanup (Phase 1 Complete)                       │
│    Agent: general-folder-cleanup-agent                        │
│    Verifies canonical project structure                        │
│    ✋ User approval if corrections needed                      │
└────────────────┬───────────────────────────────────────────────┘
                 ↓
         Phase 1 Complete
         Ready for prototypes
```

**Phase 2: Prototype Cycle** (Repeatable for each module)

```
Start: Continue with orchestrator or /research-prototype
         │
         ↓
┌────────────────────────────────────────────────────────────────┐
│ 1. Research-to-Design (Combined BA + UX)                      │
│    Agent: prototype-research-design-agent                     │
│                                                                │
│    Workflow 1: Requirements Research                          │
│      • Brief & materials review                               │
│      • Complexity check (stops if too complex)                │
│      • Requirements Q&A (conversational skill)                │
│      • Document prototype requirements                        │
│      ✋ User approval required                                │
│                                                                │
│    Workflow 2: Design Intent (after approval)                 │
│      • Clarify purpose, compile user tasks                    │
│      • Suggest views, patterns, architecture                  │
│      • Define flows, controls, MVP features                   │
│      ✋ User approval required                                │
│                                                                │
│    Outputs:                                                    │
│      • prototype-requirements.md                              │
│      • design-brief.md                                         │
│      • user-verification-tasks.md                             │
└────────────────┬───────────────────────────────────────────────┘
                 ↓
┌────────────────────────────────────────────────────────────────┐
│ 2. Prototype Implementation                                   │
│    Agent: prototype-development-agent                         │
│    Input: All 3 docs + design tokens + business requirements  │
│    Output: Working prototype in prototypes/[name]/            │
│    Updates: Landing page with link to new prototype           │
│    👤 Manual action: Test prototype, provide feedback         │
│    ✋ User approval required                                   │
└────────────────┬───────────────────────────────────────────────┘
                 ↓
┌────────────────────────────────────────────────────────────────┐
│ 3. Code Review & Compliance Gate                              │
│    Agent: general-code-review-agent                           │
│    Reviews code against specs and rules                        │
│    Produces Problem List if issues found                       │
│    Orchestrates fixes via prototype-development-agent          │
│    Re-reviews until verdict: Acceptable                        │
│    ✋ User approval required                                   │
└────────────────┬───────────────────────────────────────────────┘
                 ↓
┌────────────────────────────────────────────────────────────────┐
│ 4. Validation & Revision (Optional)                           │
│    Triggered by: User feedback during testing                 │
│    Agent fixes issues in tightly scoped changes               │
│    Focus: One round of feedback per prototype                 │
└────────────────┬───────────────────────────────────────────────┘
                 ↓
┌────────────────────────────────────────────────────────────────┐
│ 5. Structure Cleanup (Prototype Cycle Complete)               │
│    Agent: general-folder-cleanup-agent                        │
│    Verifies canonical project structure                        │
│    ✋ User approval if corrections needed                      │
└────────────────┬───────────────────────────────────────────────┘
                 ↓
         Prototype Complete
              │
              ├─→ Build another prototype? → Repeat Phase 2
              │
              └─→ Done? → Project complete
```

**Legend:**
- ✋ = User approval gate (workflow pauses for your decision)
- 👤 = Manual user action required
- ↓ = Automatic progression to next step

**Key Points:**
- Phase 1 runs once, Phase 2 repeats for each prototype
- Each approval gate requires explicit user confirmation
- Cleanup agents verify structure compliance at end of each phase
- All prototypes share the foundation (business requirements, design tokens)
- Each prototype cycle is independent and produces 3 documents + working code

## 4. Using The Framework

### 4.1 Run the Setup Script

Execute the setup script:

```powershell
.\setup-proto.ps1
```

Or perform these steps manually:
- Create the project folder
- Clone the `agent-prototyping-system` repository into the folder
- Create a `prototypes` folder in the project root
- Create a `project-docs` folder in the `docs/` folder

### 4.2 Define The Project

Navigate to the project folder and optionally add any project information you may have to the `docs/project-docs` folder. If you don't provide any information, an agent will guide you through a set of questions. 

Project information examples:
- A project brief
- Meeting notes
- Wireframes
- Data models
- Customer documents

### 4.3 Start Claude Code

Start Claude Code

```powershell
cd your-project-folder-name
claude --model claude-4-5-opus
```

### 4.4 Invoke The Project Orchestration Agent

Once Claude Code is running, invoke the Project Orchestration Agent using the slash command:

```
/start
```

The orchestrator will guide you through the project setup workflow.

### 4.5 Identify Modules To Prototype

Identify a module you want to prototype. Then create a sub-folder in the `docs/project-docs` for this module like this:

`docs/project-docs/prototype-[module-name]`

Optionally add any module information you may have to the `docs/project-docs/prototype-[module-name]` folder. If you don't provide any information, an agent will guide you through a set of questions. 

Optional Module Information:

- A module brief
- Wireframes
- Data models

The orchestrator will guide you through the prototype workflow.

## 5. Individual Agent Commands

You can invoke specific agents directly using their slash commands:

**Primary Command:**
- `/start` - Start the project orchestrator (guides you through entire workflow)

**Phase 1 Commands:**
- `/project-requirements` - Business requirements gathering
- `/style-tokens` - Design token extraction
- `/setup-project` - Application setup

**Phase 2 Commands:**
- `/research-prototype` - Combined requirements research and design workflow (produces 3 documents)
- `/develop-prototype` - Prototype implementation
- `/review-code` - Code review & compliance gate

**Utility Commands:**
- `/review-requirements-document` - Review requirements documents
- `/cleanup-folders` - Verify and enforce project structure compliance

---

## 6. Requirements

- [Claude Code CLI](https://claude.com/claude-code)
- PowerShell (for running setup-proto.ps1)
