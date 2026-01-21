# Prototyping Framework

A structured, agent-based framework for creating consistent, defensible prototypes through coordinated AI workflows.

## Table of Contents
1. [Quick Start](#1-quick-start)
2. [Purpose](#2-purpose)
3. [The Workflow](#3-the-workflow)
4. [Using The Framework](#4-using-the-framework)
   1. [Preparing Customer Requirements](#41-preparing-customer-requirements)
   2. [Run the Setup Script](#42-run-the-setup-script)
   3. [Define Input Documents](#43-define-input-documents)
   4. [Start Claude Code](#44-start-claude-code)
   5. [Invoke The Project Orchestration Agent](#45-invoke-the-project-orchestration-agent)
   6. [Identify Prototypes To Build](#46-identify-prototypes-to-build)
   7. [Testing Prototypes](#47-testing-prototypes)
   8. [Debugging Prototype Issues](#48-debugging-prototype-issues)
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

AI-augmented prototyping transforms the design process from slow, static documentation into a tangible, visual "proof of understanding." When rapid generation is combined with deep domain expertise it can demonstrate to the customer how their business problem will be solved. 

AI allows experts to generate high-fidelity, tactile realities in a fraction of the time, serving as a visual contract that aligns stakeholder expectations with technical feasibility. By validating complex logic early, organisations also significantly reduce developmental rework and replace uncertainty with confidence.

This framework provides a systematic approach to prototype development by orchestrating specialized AI agents, each responsible for a specific phase of the prototyping process. The goal is to ensure:

- **Consistency**: Shared design tokens and business requirements across all prototypes
- **Quality**: Structured workflows that prevent shortcuts and ensure completeness
- **Defensibility**: Clear documentation and rationale at every step
- **Efficiency**: Reusable foundation work across multiple prototypes

## 3. The Workflow

The framework implements prototypes in a **two-phase approach**:

#### High-Level Overview

1. **Phase 1: Project Foundation** (run once)
   - Gather business requirements
   - Extract design tokens from your brand
   - Set up the React application and landing page
   - Code review foundation code (scaffolding, landing page)
   - Verify project structure compliance

2. **Phase 2: Prototype Cycle** (repeat for each prototype)
   - Requirements Research → Design Intent → Implement → Code review → Validate
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

**Phase 2: Prototype Cycle** (Repeatable for each prototype)

```
Start: Continue with orchestrator or /research-prototype
         │
         ↓
┌────────────────────────────────────────────────────────────────┐
│ 1. Requirements Research (BA + UX Research)                   │
│    Agent: prototype-requirements-agent                        │
│                                                                │
│    • Module identification & user guidance                    │
│    • Brief & materials review                                 │
│    • Complexity check (stops if too complex)                  │
│    • Read framework requirements                              │
│    • Requirements Q&A (conversational skill)                  │
│    • Document combined business and user requirements         │
│    • Requirements quality review                              │
│    ✋ User approval required                                  │
│                                                                │
│    Output: prototype-requirements.md                          │
└────────────────┬───────────────────────────────────────────────┘
                 ↓
┌────────────────────────────────────────────────────────────────┐
│ 2. Design Intent (Systems + Interface Design)                 │
│    Agent: prototype-design-agent                              │
│                                                                │
│    • Read and validate requirements                           │
│    • Clarify prototype purpose                                │
│    • Extract and organize user tasks                          │
│    • Suggest views, patterns, architecture (numbered options) │
│    • Define task flows                                        │
│    • Identify controls (common vs custom)                     │
│    • Define MVP feature set                                   │
│    • Document design intent                                   │
│    • Create user verification tasks                           │
│    • Design documentation quality review                      │
│    ✋ User approval required                                  │
│                                                                │
│    Outputs:                                                    │
│      • design-brief.md                                         │
│      • user-verification-tasks.md                             │
└────────────────┬───────────────────────────────────────────────┘
                 ↓
┌────────────────────────────────────────────────────────────────┐
│ 3. Prototype Implementation                                   │
│    Agent: prototype-development-agent                         │
│    Input: All 3 docs + design tokens + business requirements  │
│    Output: Working prototype in prototypes/[name]/            │
│    Updates: Landing page with link to new prototype           │
│    👤 Manual action: Test prototype, provide feedback         │
│    ✋ User approval required                                   │
└────────────────┬───────────────────────────────────────────────┘
                 ↓
┌────────────────────────────────────────────────────────────────┐
│ 4. Code Review & Compliance Gate                              │
│    Agent: general-code-review-agent                           │
│    Reviews code against specs and rules                        │
│    Produces Problem List if issues found                       │
│    Orchestrates fixes via prototype-development-agent          │
│    Re-reviews until verdict: Acceptable                        │
│    ✋ User approval required                                   │
└────────────────┬───────────────────────────────────────────────┘
                 ↓
┌────────────────────────────────────────────────────────────────┐
│ 5. Validation & Revision (Optional)                           │
│    Triggered by: User feedback during testing                 │
│    Agent fixes issues in tightly scoped changes               │
│    Focus: One round of feedback per prototype                 │
└────────────────┬───────────────────────────────────────────────┘
                 ↓
┌────────────────────────────────────────────────────────────────┐
│ 6. Structure Cleanup (Prototype Cycle Complete)               │
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

---

## 4. Using The Framework

### 4.1 Preparing Customer Requirements

Before using the framework, you need to gather requirements from your stakeholders and customers. The quality of your input directly impacts the quality of your prototypes. This section guides you through the requirements collection effort.

#### Understanding What You Need to Collect

The framework needs two levels of requirements:

**Project-Level (Phase 1 - once per project):**
- Overall business goals and context
- Target user personas
- Success metrics and constraints
- Customer website URL (for brand styling)

**Prototype-Level (Phase 2 - per prototype):**
- Specific feature or workflow scope
- User tasks for this prototype
- Business value and constraints
- Known design preferences or risks

#### Requirements Collection Process

**1. Conduct Stakeholder Interviews**

**Who to interview:**
- **Business stakeholders** - Goals, constraints, success metrics
- **End users** - Workflows, pain points, current processes
- **Subject matter experts** - Domain knowledge, business rules, edge cases
- **Technical stakeholders** - Integration points, technical constraints

**Questions to ask (Project Level):**
- What business problem are we solving? Why now?
- Who are the primary users and their roles?
- How will we measure success?
- What are the key constraints?
- What assumptions exist?

**Questions to ask (Prototype Level):**
- What user tasks must this prototype support? (3-5 core actions)
- Why does this prototype matter to the business?
- What's the current process? What are the pain points?
- Are there any known design preferences or constraints?
- What risks should we explore?

**2. Document Interview Findings**

**For Project-Level:**
- Business context and goals
- Target user personas
- Success metrics
- Key constraints
- Assumptions and dependencies

**For Prototype-Level:**
- Prototype scope and purpose
- 3-5 core user tasks
- Business value
- Constraints or preferences
- Supporting materials

**3. Focus on "What" and "Why", Not "How"**

- ✅ **What** problem needs solving
- ✅ **Why** it matters to business and users
- ✅ **Who** will use it and in what context
- ❌ **NOT How** to design or implement

#### Requirements Collection Best Practices

**✅ Do:**
- Interview multiple stakeholders for diverse perspectives
- Document business and user value with real examples
- Flag uncertainties and constraints explicitly

**❌ Don't:**
- Specify exact UI layouts or prescribe solutions
- Over-scope prototypes or mix unrelated features
- Use vague success criteria

#### Output: Documented Requirements Ready for Framework

Once you've collected and documented requirements, you're ready to provide them to the framework. See section 4.3 for how to structure this information as input files.

---

### 4.2 Run the Setup Script

Execute the setup script:

```powershell
.\setup-proto.ps1
```

Or perform these steps manually:
- Create the project folder
- Clone the `agent-prototyping-system` repository into the folder
- Create a `prototypes` folder in the project root
- Create a `project-docs` folder in the `docs/` folder

### 4.3 Define Input Documents

After running the setup script, provide your documented requirements as input to the framework. This section explains how to structure requirements and supporting materials for both project-level (Phase 1) and prototype-level (Phase 2) inputs.

#### Where to Place Your Requirements

The setup script creates this folder structure:

```
your-project-folder/
  docs/
    project-docs/          # Place your materials here
      (your files)
    framework-docs/        # Framework documentation (don't modify)
  prototypes/              # Framework builds prototypes here
```

#### Project-Level Inputs (Phase 1 - Once Per Project)

**Required:**
- **Customer website URL** - Provide when the Business Requirements Agent asks. The framework extracts brand styling and design tokens.

**Optional but recommended:**

Create a project brief in `docs/project-docs/` containing:
- Business problem and objectives
- Target user personas
- Success metrics (business outcomes)
- Key constraints (budget, timeline, technical, regulatory)
- Assumptions and dependencies

Supporting materials (optional):
- Workshop notes, meeting summaries
- Strategy documents, market research

**What the framework does:**
- Business Requirements Agent reads your materials
- Conducts conversational Q&A for clarification
- Creates `docs/project-docs/business-requirements.md`
- You approve before proceeding

**If you don't provide materials:**
- Agent guides you through comprehensive Q&A
- Agent captures and structures your responses

#### Prototype-Level Inputs (Phase 2 - Per Prototype)

For each prototype, create a subfolder in `docs/project-docs/`:

```
docs/project-docs/prototype-[prototype-name]/
  brief.md             # Prototype definition (recommended)
  wireframes/          # Visual references (optional)
  data-models/         # Data examples (optional)
  supporting-materials/  # Additional context (optional)
```

**Naming convention:** Use kebab-case (e.g., `prototype-customer-onboarding`, `prototype-dashboard-overview`)

**Recommended: Create a prototype brief (`brief.md`)**

Structure:
```markdown
# Prototype: [Descriptive Name]

## Purpose
[1-2 sentences: What does this prototype enable users to do?]

## Core User Tasks
1. [Task 1 - specific, observable action]
2. [Task 2 - specific, observable action]
3. [Task 3 - specific, observable action]

## Business Value
[Why does this prototype matter? What problem does it solve?]

## Known Constraints
- [Technical, regulatory, or business constraints]

## Uncertainties to Explore
- [Questions the prototype should help validate]
```

Supporting materials (optional):
- Wireframes or mockups (PNG, JPG, PDF)
- Data models (JSON, CSV, markdown tables)
- User research findings, workflow diagrams

**What the framework does:**
- Requirements Research Agent reads your brief
- Conducts Q&A to clarify requirements
- Creates `prototype-requirements.md`
- Design Agent creates `design-brief.md` and `user-verification-tasks.md`
- You approve before implementation

**If you don't provide a brief:**
- Agent guides you through Q&A
- Agent captures and structures your responses

#### Tips for Structuring Input Documents

**Use plain markdown (`.md`) format** - Easy to read, works well with AI agents, version control friendly

**Be descriptive, not prescriptive:**
- ✅ "Users need to review and approve requests quickly on mobile devices"
- ❌ "Create a table with green approve and red reject buttons"

**Include real examples:**
- ✅ "When amount exceeds threshold by 10%, highlight both values"
- ❌ "Handle discrepancies"

**Flag uncertainties:**
- ✅ "Not sure if users need side-by-side comparison - need to test"
- ❌ Pretending certainty when uncertain

**Provide context, not solutions:**
- ✅ "Reason required for audit compliance"
- ❌ "Use a dropdown for reasons"

### 4.4 Start Claude Code

Start Claude Code

```powershell
cd your-project-folder-name
claude --model claude-4-5-opus
```

### 4.5 Invoke The Project Orchestration Agent

Once Claude Code is running, invoke the Project Orchestration Agent using the slash command:

```
/start
```

The orchestrator will guide you through the project setup workflow. This begins with the framework agents reading your materials to guide conversational Q&A sessions. 

### 4.6 Identify Prototypes To Build

After Phase 1 is complete (business requirements, design tokens, and project setup), decompose your system into smaller prototypes through modularization. Rather than building one massive prototype of your entire system, you create **many small, focused prototypes** - each representing a distinct feature or workflow.

**The result**: One landing page that links to multiple independent prototypes, each exploring a specific part of your system.

#### How to Think About Prototypes

Think about your system as a collection of independent features or workflows:
- Individual user tasks or journeys
- Specific features or capabilities
- Critical interaction patterns
- Alternative approaches to solve the same problem
- High-risk or uncertain design decisions

Each prototype should be small enough to build, review, and test in a focused session.

#### What Makes a Good Prototype

**Good scope:**
- ✅ "Customer onboarding workflow" - focused, specific tasks
- ✅ "Profile settings page" - bounded scope
- ✅ "Dashboard overview" - clear deliverable

**Too broad:**
- ❌ "Customer portal" - encompasses many features
- ❌ "Complete CRM system" - too complex for one prototype

For guidance on defining prototype scope, see section 4.3.

#### Creating the Prototype Folder

Once you've identified a prototype to build, create a subfolder in `docs/project-docs`:

`docs/project-docs/prototype-[prototype-name]`

**Naming convention:** Use kebab-case (e.g., `prototype-customer-onboarding`, `prototype-dashboard-overview`)

Optionally add prototype information to this folder:
- A prototype brief (`brief.md`)
- Wireframes or mockups
- Data models or schemas

If you don't provide any information, an agent will guide you through a set of questions.

The orchestrator will guide you through the prototype workflow.


---

### 4.7 Testing Prototypes

Prototype testing validates that your design decisions work for real users before investing in full development. This section outlines best practices for effective usability testing.

#### Purpose of Prototype Testing

**Validation goals:**
- **Verify task completion** - Can users actually complete the core tasks?
- **Identify usability issues early** - Find problems before development begins
- **Test design assumptions** - Validate or challenge your design decisions
- **Compare alternatives** - Test multiple approaches side-by-side
- **Build stakeholder confidence** - Create tangible evidence that the design works

Prototypes are "proof of understanding" - they demonstrate that your team understands the problem and has a viable solution.

#### Who Should Test

**Primary testers:**
- **Actual end-users** - People who will use the system in their daily work
- **Representative personas** - Users matching your target user profiles

**Secondary testers:**
- **Subject matter experts** - Domain specialists who understand the business context
- **Stakeholders** - Decision-makers who need to validate business value

**Test facilitators:**
- **UX designers, product managers, business analysts** - Guide sessions and capture feedback

**When to involve developers:**
- After usability validation to discuss technical feasibility
- To understand implementation constraints before finalizing designs

#### Testing Methodology

**Task-based usability testing** (recommended approach):

1. **Use the verification tasks document** - The framework generates `user-verification-tasks.md` for each prototype. Use this as your test script.

2. **Give users realistic scenarios** - Frame tasks as real-world situations, not UI instructions:
   - ✅ "A new customer request just arrived. Review it and decide how to proceed."
   - ❌ "Click the item in the table, then click the button."

3. **Observe without helping** - Let users struggle. That's where you learn what's confusing.

4. **Ask users to think aloud** - Encourage users to verbalize their thoughts as they work:
   - "What are you looking for?"
   - "What do you expect will happen when you click that?"
   - "What's confusing you right now?"

**Moderated vs. unmoderated testing:**

- **Moderated** (recommended for prototypes):
  - Facilitator guides user through tasks
  - Can ask follow-up questions in real-time
  - Provides deeper insights into user thinking
  - Better for identifying "why" behind behaviors

- **Unmoderated**:
  - User tests alone, provides written feedback
  - Faster and cheaper for large sample sizes
  - Less depth, misses subtle insights
  - Better for simple validation tests

**Test session structure** (30-45 minutes typical):

1. **Introduction (5 min)** - Explain what's being tested, set expectations
   - "We're testing the prototype, not you"
   - "Please think aloud as you work"
   - "There are no wrong answers"

2. **Task scenarios (20-30 min)** - Work through verification tasks from design document
   - Present one task at a time
   - Don't intervene unless user is completely stuck
   - Note where users hesitate, struggle, or express confusion

3. **Follow-up questions (5-10 min)** - Explore what worked and what didn't
   - "What was most confusing?"
   - "What felt natural?"
   - "What would you change?"

4. **Open feedback (5 min)** - Invite any additional thoughts
   - "Is there anything else you'd like to share?"

#### What to Observe

**Task completion:**
- Can users complete tasks without help?
- How many attempts does it take?
- Do users give up or find workarounds?

**Navigation patterns:**
- Do users find the right paths intuitively?
- Where do they get lost or backtrack?
- Are they clicking where you expect?

**Hesitation points:**
- Where do users pause, unsure what to do next?
- What causes them to stop and think?
- When do they look confused or frustrated?

**Error recovery:**
- When users make mistakes, can they recover easily?
- Do error messages help or confuse?
- Can users undo actions if needed?

**Terminology and labels:**
- Do labels make sense to users?
- Are instructions clear?
- Does terminology match users' mental models?

**Expectations vs. reality:**
- What do users expect to happen vs. what actually happens?
- Are there surprising behaviors or outcomes?
- Do users understand system responses?

**Satisfaction indicators:**
- Facial expressions (smiles, frowns, confusion)
- Verbal reactions ("Oh!", "Huh?", "That's easy")
- Confidence levels and body language

#### Capturing Feedback

**Use the framework's bug reporting format:**

When users encounter issues, document them using this structure:
- **Task**: Which verification task were they attempting?
- **What happened**: Describe the issue or confusion
- **What expected**: What did the user expect to happen?
- **Optional**: Screenshot or screen recording

**Document patterns, not one-offs:**
- Focus on issues that affect multiple users (3+ users = pattern)
- Note whether issues **block** task completion or just **slow it down**
- Distinguish "user struggled" from "user expressed preference"

**Prioritize feedback:**
- **Critical**: Blocks task completion (must fix)
- **High**: Causes significant confusion or errors (should fix)
- **Medium**: Slows down workflow (nice to fix)
- **Low**: Minor preferences or nice-to-haves (consider for future)

#### Sample Size Guidelines

**For prototype testing: 3-5 users per persona**
- Nielsen Norman Group research shows 5 users find ~85% of usability issues
- Enough to identify major problems
- Fast turnaround for iterative cycles
- Cost-effective for rapid prototyping

**When to test more:**
- Testing multiple user personas (3-5 per persona)
- Very diverse user base with different needs

#### From Feedback to Action

**Revision workflow:**
1. **Prioritize issues** - Focus on critical and high-priority items first
2. **Fix in tightly scoped changes** - One issue at a time
3. **Re-run code review** - Ensure fixes maintain quality
4. **Re-test critical changes** - Validate fixes with users

**When to iterate vs. rebuild:**
- **Iterate**: Minor usability tweaks, terminology changes, flow adjustments
- **Rebuild**: Fundamental design approach isn't working, scope was wrong, wrong user tasks

#### Best Practices

**✅ Do:**
- Test early and often (don't wait for perfection)
- Focus on core tasks from verification task list
- Watch what users do, not just what they say
- Use realistic data and scenarios
- Allow users to explore freely between tasks
- Record sessions (with permission) for later analysis
- Share findings with team immediately
- Test in the user's actual environment when possible

**❌ Don't:**
- Don't explain how to use the prototype upfront
- Don't defend design choices during testing
- Don't lead users to the "right" answer
- Don't interrupt users while they're working
- Don't test only with internal team members
- Don't skip testing because "we already know it works"

#### Recommended Resources

- [Nielsen Norman Group: Usability Testing 101](https://www.nngroup.com/articles/usability-testing-101/)
- [Steve Krug: "Rocket Surgery Made Easy"](https://sensible.com/rocket-surgery-made-easy/)
- [Steve Krug: "Don't Make Me Think"](https://sensible.com/dont-make-me-think/)

---

### 4.8 Debugging Prototype Issues

When testing prototypes, you may encounter bugs or unexpected behavior. This section provides a quick reference for reporting issues to Claude Code effectively.

#### Quick Bug Report Template

When you find an issue, describe it clearly and reference the relevant file:

```
In @filename, [describe what's wrong].

Expected: [what should happen]
Actual: [what's happening instead]
```

**Example:**
```
In @CustomerDashboard.jsx, clicking "Export" does nothing.

Expected: CSV download should start
Actual: Button click has no effect
```

#### What to Include

Help Claude diagnose issues faster by including:

1. **What went wrong** - Describe the unexpected behavior
2. **Steps to reproduce** - How to trigger the issue
3. **Current data** (if relevant) - What values are displaying incorrectly
4. **Console errors** (if available) - Check browser console (F12) for red error messages
5. **Context** - Which browser, which prototype, any recent changes

#### Prioritizing Multiple Issues

When reporting several bugs at once, indicate priority:

- **Blockers** - Stops you from completing core tasks (e.g., "Save button doesn't work")
- **Data Issues** - Shows incorrect information (e.g., "Total displays wrong amount")
- **Functional** - Feature works inconsistently (e.g., "Search only works sometimes")
- **Cosmetic** - Visual issues (e.g., "Button text misaligned")

Focus on blockers first—they prevent testing the rest of the prototype.

#### If You Have a Theory

If you suspect what's causing the issue, share your observation:

- ✅ "The list might not be refreshing when I add a new item"
- ✅ "It seems like the form submits before validating the email"
- ❌ Avoid technical jargon unless you're familiar with React (let Claude diagnose)

You don't need to know how to fix it—just describe what you observe.

#### Using Claude Code Features

**Focus Claude on specific files:**
Use `@filename` to point Claude to the relevant code. This helps Claude target the issue quickly.

**Reset if Claude gets confused:**
If Claude seems stuck or suggests unrelated fixes, use `/clear` to reset the conversation and start fresh with a clear bug report.

**For complex issues:**
If the bug is tricky, ask Claude to analyze more thoroughly: "This seems complex—can you investigate the root cause before suggesting a fix?"

---

## 5. Individual Agent Commands

You can invoke specific agents directly using their slash commands:

**Primary Command:**
- `/start` - Start the project orchestrator (guides you through entire workflow)

**Phase 1 Commands (Foundation - Run Once):**
- `/project-requirements` - Business requirements gathering
- `/style-tokens` - Design token extraction
- `/setup-project` - Application setup

**Phase 2 Commands (Prototype Cycle - Repeat for Each Prototype):**

The prototype cycle now uses a **two-agent approach** that separates requirements research from design:

1. **Requirements Research** (First Step):
   - `/research-prototype` - BA + UX research combining business and user perspectives
   - Produces: `prototype-requirements.md`
   - No design decisions made at this stage
   - After approval, orchestrator automatically invokes design agent

2. **Design Intent** (Second Step):
   - `/design-prototype` - Systems + Interface design based on approved requirements
   - Produces: `design-brief.md` and `user-verification-tasks.md`
   - Suggests views, patterns, flows, and controls with numbered options
   - Requires approved requirements document

3. **Implementation & Review**:
   - `/develop-prototype` - Build prototype based on all 3 documents
   - `/review-code` - Code review & compliance gate

**Utility Commands:**
- `/cleanup-folders` - Verify and enforce project structure compliance
- `/debug-prototype` - Debug assistant for investigating bugs (auto-invoked when you report issues)

**Workflow Note:** When using the orchestrator (`/start`), it automatically sequences the requirements and design agents for you. You only need the individual commands if you want to run specific steps manually.

---

## 6. Requirements

- [Claude Code CLI](https://claude.com/claude-code)
- PowerShell (for running setup-proto.ps1)
