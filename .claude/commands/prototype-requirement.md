# /prototype-requirement

## Description
Clarify and document prototype-specific requirements through focused, confidence-aware research.

This command invokes the **prototype-requirements-agent** to:
- Explore prototype-specific intent
- Reduce ambiguity without over-analysis
- Produce a clear, non-technical requirements snapshot
- Prepare clean input for prototype generation

---

## Agent
prototype-requirements-agent.md

---

## When to Use
Use this command when:
- Business requirements already exist
- You are ready to define a specific prototype
- The scope is unclear or partially defined
- You need alignment before building anything

Do NOT use this command to:
- Define overall business goals
- Replace business requirements gathering
- Write code

---

## Preconditions
Before running `/prototype-requirement`:
- `docs/project-docs/business-requirements.md` MUST exist
- The prototype name MUST be known or agreed

If these conditions are not met, the agent will stop and explain what is missing.

---

## Inputs
The agent will use:
- Existing business requirements
- Any prototype context provided in the conversation
- Follow-up Q&A where needed

You do NOT need to prepare a formal brief.

---

## Outputs
On completion, the agent will create:
docs/[prototype-name]/prototype-requirements.md


This document will contain:
- Prototype purpose
- Target user
- Core user need
- Success indicators
- Constraints and exclusions
- Key assumptions

---

## Behavior
When this command is invoked, the agent will:
1. Check that business requirements exist
2. Ask one question at a time to clarify prototype intent
3. Use examples to guide answers
4. Apply confidence scoring to avoid over-questioning
5. Stop once requirements are "good enough to proceed"
6. Present the document for approval

---

## Usage Example
/prototype-requirement
