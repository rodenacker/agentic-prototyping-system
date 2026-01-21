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
   1. [Preparing Customer Requirements](#41-preparing-customer-requirements)
   2. [Run the Setup Script](#42-run-the-setup-script)
   3. [Define The Project](#43-define-the-project)
   4. [Start Claude Code](#44-start-claude-code)
   5. [Invoke The Project Orchestration Agent](#45-invoke-the-project-orchestration-agent)
   6. [Identify Modules To Prototype](#46-identify-modules-to-prototype)
   7. [Define Module Inputs](#47-define-module-inputs)
   8. [Testing Prototypes](#48-testing-prototypes)
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

AI-augmented prototyping transforms the design process from slow, static documentation into a dynamic "proof of understanding." AI allows experts to generate high-fidelity, tactile realities in a fraction of the time, serving as a visual contract that aligns stakeholder expectations with technical feasibility. 

When rapid generation is combined with deep domain expertise it demonstrates how the customers business problem will be solved. By validating complex logic early, organisations also significantly reduce developmental rework and replace theoretical uncertainty with the tangible confidence required to drive high-stakes investment.

This framework provides a systematic approach to prototype development by orchestrating specialized AI agents, each responsible for a specific phase of the prototyping process. The goal is to ensure:

- **Consistency**: Shared design tokens and business requirements across all prototypes
- **Quality**: Structured workflows that prevent shortcuts and ensure completeness
- **Defensibility**: Clear documentation and rationale at every step
- **Efficiency**: Reusable foundation work across multiple prototypes

## 3. How It Works

### 3.1 Design Philosophy

This framework is built on three core principles:

#### 1. Modular Complexity Management

Rather than building one massive prototype of your entire system, you create **many small, focused prototypes** - each representing a distinct module or feature.

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

**Phase 2: Prototype Cycle** (Repeatable for each module)

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

**Bug Reporting During Testing:**
If you encounter issues while testing a prototype, simply describe what's wrong in natural language. The orchestrator will automatically detect bug reports and invoke the Debug Assistant to help diagnose the issue.

Example trigger phrases:
- "This doesn't work"
- "I found a bug"
- "When I click X, Y happens instead"
- "Something's wrong with [feature]"

The Debug Assistant will:
- Help you understand what's happening
- Narrow down the likely cause
- Suggest focused next steps or fixes
- Route to the appropriate fix agent if needed

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

**Module-Level (Phase 2 - per prototype):**
- Specific feature or workflow scope
- User tasks for this module
- Business value and constraints
- Known design preferences or risks

#### Requirements Collection Process

**1. Conduct Stakeholder Interviews**

Before starting the framework, gather input from key stakeholders:

**Who to interview:**
- **Business stakeholders** - Understand business goals, constraints, success metrics
- **End users** - Understand workflows, pain points, current processes
- **Subject matter experts** - Understand domain knowledge, business rules, edge cases
- **Technical stakeholders** - Understand integration points, technical constraints

**Questions to ask (Project Level):**
- What business problem are we solving? Why now?
- Who are the primary users? What are their roles and responsibilities?
- How will we measure success? (business outcomes, not features)
- What are the key constraints? (budget, timeline, technical, regulatory)
- What assumptions are we making? What dependencies exist?

**Questions to ask (Module Level):**
- What user tasks must this module support? (3-5 core actions)
- Why does this module matter to the business?
- What's the current process? What are the pain points?
- Are there any known design preferences or constraints?
- What risks or uncertainties should we explore?

**2. Document Interview Findings**

Capture stakeholder input in written form:

**For Project-Level Requirements:**
- Document business context and overall goals
- List target user personas with roles
- Define success metrics (business outcomes)
- Note key constraints (budget, timeline, technical, regulatory)
- Document assumptions and dependencies

**For Module-Level Requirements:**
- Define module scope and purpose
- List 3-5 core user tasks
- Explain business value
- Note any known constraints or preferences
- Include supporting materials (wireframes, user stories, etc.)

**3. Organize Supporting Materials**

Gather any existing documentation that provides context:

**Project-Level Materials:**
- Project briefs or vision documents
- Workshop notes or meeting summaries
- Strategy documents
- Market research or competitive analysis
- Customer website URL (for brand styling extraction)

**Module-Level Materials:**
- Wireframes or mockups (if available)
- User stories or use cases
- Workflow diagrams
- Data models or schemas
- User research findings

**4. Focus on "What" and "Why", Not "How"**

When documenting requirements, emphasize:
- ✅ **What** problem needs solving
- ✅ **Why** it matters to the business and users
- ✅ **Who** will use it and in what context
- ❌ **NOT How** to design or implement the solution

**Good example:**
> "Sales managers need to approve invoices over $10,000 within 24 hours to maintain vendor relationships and avoid late fees."

**Bad example:**
> "Build an invoice approval screen with a table and approve/reject buttons."

#### Requirements Collection Best Practices

**✅ Do:**
- Interview multiple stakeholders to get diverse perspectives
- Document both business and user value
- Include real-world scenarios and examples
- Flag uncertainties and areas needing exploration
- Reference existing patterns users already understand
- Be specific about constraints and success criteria

**❌ Don't:**
- Specify exact UI layouts or components
- Mix multiple unrelated features in one module
- Use vague success criteria ("make it user-friendly")
- Prescribe design solutions before exploring alternatives
- Over-scope modules (keep them small enough to prototype in one cycle)
- Skip user context (who will use this and why?)

#### Output: Documented Requirements Ready for Framework

Once you've collected and documented requirements, you're ready to provide them to the framework. The next section (4.3 Define The Project) explains how to structure this information as input files.

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

### 4.3 Define The Project

After running the setup script, you need to provide your documented requirements as input to the framework. This section explains how to structure your requirements and supporting materials so the framework can use them effectively.

#### Where to Place Your Requirements

The setup script creates this folder structure:

```
your-project-folder/
  docs/
    project-docs/          # Place project-level materials here
      (your files)
    framework-docs/        # Framework documentation (don't modify)
  prototypes/              # Framework will build prototypes here
```

#### Project-Level Inputs (Phase 1)

**Required:**
- **Customer website URL** - You'll provide this when the Business Requirements Agent asks. The framework extracts brand styling and design tokens from this site.

**Optional but recommended:**

Create documents in `docs/project-docs/` containing:

**1. Project brief or context document**
- Business problem being solved
- Why this project matters now
- Overall business objectives
- Target user personas
- Success metrics (business outcomes)
- Key constraints (budget, timeline, technical, regulatory)
- Assumptions and dependencies

**Example structure:**
```markdown
# Project: Invoice Management System

## Business Problem
Sales managers currently take 3-4 days to approve invoices because they must
switch between multiple systems. This delays vendor payments and damages
relationships.

## Target Users
- Primary: Sales Managers (approve invoices $10K+)
- Secondary: Finance team (audit and reconciliation)

## Success Metrics
- Reduce approval time from 3-4 days to under 24 hours
- Reduce vendor late payment fees by 50%
- Increase sales manager satisfaction score

## Constraints
- Must integrate with existing SAP system
- Regulatory requirement: audit trail for all approvals
- Timeline: MVP in 8 weeks

## Assumptions
- Sales managers have mobile access
- Invoice data can be retrieved via SAP API
```

**2. Supporting materials (optional)**
- Workshop notes
- Meeting summaries
- Strategy documents
- Market research
- Competitive analysis

**What the framework will do:**
- The Business Requirements Agent reads your materials
- Asks clarifying questions via conversational Q&A
- Creates `docs/project-docs/business-requirements.md`
- You approve before proceeding

**If you don't provide materials:**
- The agent will guide you through a comprehensive Q&A session
- You'll answer questions interactively
- The agent captures and structures your responses

#### Module-Level Inputs (Phase 2 - Per Prototype)

For each prototype, create a subfolder:

```
docs/
  project-docs/
    prototype-invoice-approval/     # One folder per prototype
      brief.md                      # Optional: module brief
      (wireframes, diagrams, etc.)  # Optional: supporting materials
```

**Optional but recommended:**

**1. Module brief (`brief.md`)**
```markdown
# Module: Invoice Approval Workflow

## Purpose
Enable sales managers to quickly review and approve/reject invoices over $10K
from mobile or desktop.

## Core User Tasks
1. View list of pending invoices requiring approval
2. Review invoice details and compare against purchase order
3. Approve invoice with one click
4. Reject invoice with reason (for audit trail)
5. See approval history for tracking

## Business Value
Reduces approval bottleneck that delays vendor payments. Current 3-4 day process
becomes same-day. Maintains vendor relationships and avoids late fees.

## Known Constraints
- Must work on mobile (managers often traveling)
- Rejection reason required for compliance
- Must integrate with SAP invoice data

## Uncertainties to Explore
- Do managers need to compare multiple invoices side-by-side?
- Should approved invoices auto-advance to next one?
- How much invoice detail is needed for decision?
```

**2. Supporting materials (optional)**
- Wireframes or mockups
- User stories
- Workflow diagrams
- Data models
- User research findings

**What the framework will do:**
- The Requirements Agent reads your module brief
- Asks clarifying questions via conversational Q&A
- Creates `docs/project-docs/prototype-[name]/prototype-requirements.md`
- You approve before proceeding
- Design Agent then creates design brief and verification tasks
- You approve before implementation

**If you don't provide a brief:**
- The agent will guide you through module-specific Q&A
- You'll define scope, tasks, and value interactively
- The agent captures and structures your responses

#### Tips for Structuring Input Documents

**Use plain markdown format** (`.md` files):
- Easy to read and edit
- Works well with AI agents
- Version control friendly

**Be descriptive, not prescriptive:**
- ✅ "Managers need to see enough invoice detail to make approval decisions"
- ❌ "Show invoice in a table with these exact columns..."

**Include real examples:**
- ✅ "When invoice exceeds PO by 10%, show both values for comparison"
- ❌ "Handle invoice discrepancies"

**Flag uncertainties:**
- ✅ "Not sure if managers need side-by-side comparison - need to test"
- ❌ Pretending you know when you're uncertain

**Provide context, not solutions:**
- ✅ "Rejection reason required for audit compliance"
- ❌ "Use a dropdown for rejection reasons"

#### What Happens Next

Once you've placed your materials in `docs/project-docs/`:

1. Start Claude Code (see section 4.4)
2. Invoke the orchestrator with `/start` (see section 4.5)
3. The orchestrator guides you through Phase 1 (project foundation)
4. After Phase 1, you identify modules to prototype (see section 4.6)
5. For each module, the orchestrator guides you through Phase 2 (prototype cycle)

The framework agents read your materials and use them to guide their conversational Q&A sessions with you.

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

The orchestrator will guide you through the project setup workflow.

### 4.6 Identify Modules To Prototype

Identify a module you want to prototype. Then create a sub-folder in the `docs/project-docs` for this module like this:

`docs/project-docs/prototype-[module-name]`

Optionally add any module information you may have to the `docs/project-docs/prototype-[module-name]` folder. If you don't provide any information, an agent will guide you through a set of questions. 

Optional Module Information:

- A module brief
- Wireframes
- Data models

The orchestrator will guide you through the prototype workflow.

### 4.7 Define Module Inputs

After identifying a module to prototype, you need to document what that module should do and provide supporting materials. This section guides you through defining module-specific inputs that inform the Research & Design and Development phases.

#### Understanding Module-Level Inputs

Module inputs are more specific than project-level inputs (from section 4.3). They focus on a single feature or workflow within the larger project:

**What makes a good module:**
- Represents 1-3 core user tasks (not the entire system)
- Can be demonstrated in 5-10 minutes
- Has clear start and end points
- Delivers specific business value
- Can be built and tested in 1-2 weeks

**Examples:**
- ✅ "Invoice approval workflow" - focused, specific tasks
- ✅ "Customer dashboard - view account summary" - bounded scope
- ❌ "Complete CRM system" - too broad, not a module
- ❌ "Settings page" - too vague, unclear tasks

#### Required Module Folder Structure

Create a folder for your module in `docs/project-docs/`:

```
docs/project-docs/prototype-[module-name]/
  brief.md                         # Core module definition (recommended)
  wireframes/                      # Visual references (optional)
  data-models/                     # Data structure examples (optional)
  supporting-materials/            # Additional context (optional)
```

**Naming convention:** Use kebab-case matching the prototype name (e.g., `prototype-invoice-approval`, `prototype-customer-dashboard`)

#### Creating a Module Brief

The module brief is the most important input. It answers: "What should this prototype do, and why does it matter?"

**File:** `docs/project-docs/prototype-[module-name]/brief.md`

**Recommended structure:**

```markdown
# Module: [Descriptive Module Name]

## Purpose
[1-2 sentences: What does this module enable users to do?]

## Core User Tasks
[List 3-5 specific tasks users must accomplish]
1. [Task 1 - specific, observable action]
2. [Task 2 - specific, observable action]
3. [Task 3 - specific, observable action]

## Business Value
[1-2 paragraphs: Why does this module matter to the business?
What problem does it solve? What's the impact of solving it?]

## Known Constraints
[List any technical, regulatory, or business constraints]
- [Constraint 1]
- [Constraint 2]

## Uncertainties to Explore
[List questions or assumptions the prototype should help validate]
- [Question 1]
- [Question 2]
```

**Example - Invoice Approval Module:**

```markdown
# Module: Invoice Approval Workflow

## Purpose
Enable sales managers to quickly review and approve/reject invoices over $10K
from mobile or desktop devices.

## Core User Tasks
1. View list of pending invoices requiring my approval
2. Review invoice details and compare against purchase order
3. Approve invoice with one click
4. Reject invoice with reason (for compliance audit trail)
5. See approval history for tracking

## Business Value
Reduces approval bottleneck that currently delays vendor payments by 3-4 days.
Same-day approvals maintain vendor relationships and avoid late payment fees
(currently $15K/month in penalties).

## Known Constraints
- Must work on mobile (managers often traveling)
- Rejection reason required for compliance
- Must retrieve invoice data from SAP system
- Approval action must be logged for audit trail

## Uncertainties to Explore
- Do managers need to compare multiple invoices side-by-side?
- Should approved invoices auto-advance to the next one?
- How much invoice detail is needed for approval decision?
- Should managers be notified of urgent invoices (approaching due date)?
```

#### Supporting Materials (Optional)

**1. Wireframes**

If you have wireframes, sketches, or UI mockups:
- Create `wireframes/` subfolder
- Save as PNG, JPG, or PDF
- Name descriptively (e.g., `invoice-list-view.png`, `approval-modal.png`)

**What to include:**
- Key screens or views
- Layout ideas or inspiration
- Existing UI that should be replaced

**Remember:** Wireframes are reference material, not prescriptive designs. The Research & Design Agent will analyze them but create its own design decisions based on requirements.

**2. Data Models**

If you have data structure examples or schemas:
- Create `data-models/` subfolder
- Save as JSON, CSV, or markdown tables
- Include realistic sample data

**Example - Invoice Data Model (`data-models/sample-invoice.json`):**
```json
{
  "invoiceId": "INV-2024-0123",
  "vendor": "Acme Supplies Inc",
  "amount": 15000.00,
  "currency": "USD",
  "dueDate": "2024-02-15",
  "purchaseOrder": "PO-2024-0089",
  "items": [
    {
      "description": "Office furniture - standing desks",
      "quantity": 10,
      "unitPrice": 1200.00,
      "totalPrice": 12000.00
    }
  ],
  "approver": "Sarah Johnson",
  "status": "pending"
}
```

**3. Supporting Materials**

For additional context:
- Create `supporting-materials/` subfolder
- Include screenshots of existing systems
- Reference documents or compliance requirements
- User research findings
- Competitive analysis

#### Best Practices for Module Documentation

**1. Focus on "What" and "Why", Not "How"**

```markdown
✅ GOOD - Descriptive
"Users need to approve invoices quickly while traveling, without
accessing their desktop computer."

❌ BAD - Prescriptive
"Create a mobile-responsive table with a green approve button and
red reject button at the top of each row."
```

**2. Define Observable Tasks**

```markdown
✅ GOOD - Observable, testable
"View list of pending invoices requiring approval"

❌ BAD - Vague, untestable
"Access invoice management features"
```

**3. Articulate Business Value Clearly**

```markdown
✅ GOOD - Specific business impact
"Reduces approval time from 3-4 days to same-day, avoiding $15K/month
in late payment fees"

❌ BAD - Generic benefit
"Makes invoice approval more efficient"
```

**4. Capture Real Constraints, Not Assumptions**

```markdown
✅ GOOD - Real constraint
"Rejection reason required for SOX compliance audit trail"

❌ BAD - Assumed solution
"Use a dropdown menu for rejection reasons"
```

**5. Frame Uncertainties as Questions**

```markdown
✅ GOOD - Testable question
"Do managers need to compare multiple invoices side-by-side?"

❌ BAD - Assumed answer
"Managers need side-by-side comparison"
```

#### What Happens With Your Module Inputs

Once you've documented your module inputs, the framework uses them in two phases:

**Phase 2A: Research & Design**
- Research & Design Agent reads your brief and supporting materials
- Conducts Q&A if needed to clarify requirements or resolve uncertainties
- Produces three outputs:
  - `prototype-requirements.md` - Detailed functional specifications
  - `design-brief.md` - Visual and interaction design specifications
  - `user-verification-tasks.md` - Testing checklist
- You review and approve before development begins

**Phase 2B: Development**
- Development Agent reads approved requirements and design brief
- Builds functional prototype using shared components
- Creates prototype-specific components as needed
- Updates landing page with link to new prototype
- You test and provide feedback

#### When to Skip or Minimize Documentation

**Skip detailed documentation if:**
- Module is extremely simple (1-2 obvious tasks)
- You'll guide the Research & Design Agent through live Q&A
- This is an exploratory prototype to test an idea

**In these cases:**
- Create the module folder
- Add minimal brief (2-3 sentences about purpose)
- Let the Research & Design Agent guide you through structured questions

The agent will ask targeted questions and create the requirements documents for you.

---

### 4.8 Testing Prototypes

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
   - ✅ "An invoice for $15,000 just arrived. Review it and decide whether to approve or reject it."
   - ❌ "Click the invoice in the table, then click the approve button."

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
- Testing multiple design alternatives (A/B comparison)
- Very diverse user base with different needs

#### Testing Multiple Prototypes

**A/B comparison testing:**
- Build two prototypes exploring different approaches to the same problem
- Test with same tasks for both prototypes
- Ask users which approach they prefer and why
- Compare completion rates, time, and satisfaction

**Progressive testing:**
- Test first prototype, gather feedback
- Build second prototype incorporating learnings
- Test with new users to validate improvements
- Iterate until design is validated

**Example:**
```
Prototype A: Hub-and-spoke (dashboard with detail views)
Prototype B: Single-page scroll (all visible, inline actions)

Test both with invoice approval tasks, compare:
- Which is faster for experienced users?
- Which is easier for first-time users?
- Which fits better with existing workflows?
```

#### From Feedback to Action

**Use the Debug Assistant:**

When users report issues during testing:
1. Describe the problem in natural language (e.g., "Users can't find the reject button")
2. The framework auto-invokes the Debug Assistant
3. Assistant helps diagnose root cause
4. Routes to appropriate fix agent

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

**Usability Testing Fundamentals:**
- [Nielsen Norman Group: Usability Testing 101](https://www.nngroup.com/articles/usability-testing-101/)
- [Steve Krug: "Rocket Surgery Made Easy"](https://sensible.com/rocket-surgery-made-easy/) - Lightweight usability testing guide
- [Steve Krug: "Don't Make Me Think"](https://sensible.com/dont-make-me-think/) - Web usability essentials

**Test Planning and Execution:**
- [IDEO Design Kit: Testing Methods](https://www.designkit.org/methods#filter)
- [GOV.UK: User Research for Government Services](https://www.gov.uk/service-manual/user-research)
- [Nielsen Norman Group: How Many Test Users in a Usability Study?](https://www.nngroup.com/articles/how-many-test-users/)

**Remote Testing:**
- [Nielsen Norman Group: Remote Usability Testing](https://www.nngroup.com/articles/remote-usability-tests/)
- [UserTesting.com: Remote Testing Best Practices](https://www.usertesting.com/resources/topics/usability-testing)

---

## 5. Individual Agent Commands

You can invoke specific agents directly using their slash commands:

**Primary Command:**
- `/start` - Start the project orchestrator (guides you through entire workflow)

**Phase 1 Commands (Foundation - Run Once):**
- `/project-requirements` - Business requirements gathering
- `/style-tokens` - Design token extraction
- `/setup-project` - Application setup

**Phase 2 Commands (Prototype Cycle - Repeat for Each Module):**

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
