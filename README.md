# Prototyping Framework

A structured, agent-based system for creating consistent, defensible prototypes through coordinated AI workflows.

## Table of Contents
1. [Quick Start](#1-quick-start)
2. [Purpose](#2-purpose)
3. [How It Works](#3-how-it-works)
   - [3.1 Design Philosophy](#31-design-philosophy)
   - [3.2 Modularization](#32-modularization)
   - [3.3 The Workflow](#33-the-workflow)
4. [Using The Framework](#4-using-the-framework)
   - [4.1 Run the Setup Script](#41-run-the-setup-script)
   - [4.2 Define The Project](#42-define-the-project)
   - [4.3 Start Claude Code](#43-start-claude-code)
   - [4.4 Invoke The Project Orchestration Agent](#44-invoke-the-project-orchestration-agent)
   - [4.5 Optional: Run Individual Agent Commands](#45-optional-run-individual-agent-commands)
5. [Requirements](#5-requirements)

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
   /project-orchestrator
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

1. **Phase 1: Project Foundation**
   - Gather business requirements
   - Extract design tokens from your brand
   - Set up the React application and landing page

2. **Phase 2: Prototype Cycle** (repeat for each module)
   - Research requirements → Design → Implement → Code review → Validate
   - Each cycle produces a clickable prototype linked from the landing page

## 4. Using The Framework

### 4.1 Run the Setup Script

Execute the setup script from anywhere:

```powershell
.\setup-proto.ps1
```

The script will:
- Prompt you for a project folder name
- Create the project folder
- Clone the `agent-prototyping-system` repository into the folder

### 4.2 Define The Project

Navigate to your new project folder and add any or all of these to the `docs/project-docs` folder:

- A project brief
- Meeting notes
- Wireframes
- Data models

### 4.3 Start Claude Code

Start Claude Code

```powershell
cd your-project-folder-name
claude --model claude-4-5-opus
```

### 4.4 Invoke The Project Orchestration Agent

Once Claude Code is running, invoke the Project Orchestration Agent using the slash command:

```
/project-orchestrator
```

The orchestrator will guide you through the workflow.

### 4.5 Optional: Run Individual Agent Commands

You can invoke specific agents directly using their slash commands:

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

---

## 5. Requirements

- [Claude Code CLI](https://claude.com/claude-code)
- PowerShell (for running setup-proto.ps1)
