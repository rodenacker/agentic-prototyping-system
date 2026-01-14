# Skill: Requirement Clarification (Sequential Q&A)

## Skill ID
requirement-clarification

## Purpose
Eliminate ambiguity in requirements by running a controlled, sequential Q&A with the user before any documentation, design, or implementation work begins.

This skill prioritizes correctness over speed.

---

## Invocation Conditions
This skill MUST be invoked when any of the following are true:
- Requirements are incomplete, vague, or underspecified
- Multiple interpretations of user intent are possible
- Key constraints, rules, or success criteria are missing
- Downstream agents depend on accurate requirements

---

## Entry Behavior
On entry:
1. Analyse the provided requirement text
2. Identify all ambiguities, gaps, and unclear constraints
3. Internally prioritise uncertainties by impact
4. DO NOT summarise or rephrase the requirement
5. DO NOT propose solutions

---

## Clarification Mode (Strict)

While in Clarification Mode, the agent MUST:

### Question Rules
- Ask **exactly one question per turn**
- Questions MUST:
  - Address one uncertainty only
  - Be unambiguous and concrete
  - Avoid technical jargon unless the user is already using it
- Questions MUST NOT:
  - Contain multiple parts
  - Suggest answers
  - Imply preferred solutions

### Interaction Rules
- Wait for the user’s response before proceeding
- Do not stack questions
- Do not restate previous answers unless needed for clarity
- Do not infer missing information

---

## Clarification Loop
Repeat the following steps until exit conditions are met:

1. Select the highest-priority unresolved uncertainty
2. Ask one clarifying question
3. Receive user response
4. Update internal understanding
5. Re-evaluate remaining uncertainties

---

## Exit Conditions
Exit Clarification Mode ONLY when:
- All critical uncertainties are resolved
- OR the user explicitly requests a summary or documentation

---

## Exit Output (Mandatory)
When exiting, produce a **Requirement Clarification Summary** with the following sections:

### 1. Clarified Requirement
- Concise, structured description
- Based strictly on user-provided answers

### 2. Confirmed Decisions
- Explicit choices made by the user
- Written as factual statements

### 3. Constraints & Rules
- Business, technical, legal, or operational constraints
- Only those explicitly stated or confirmed

### 4. Assumptions (If Any)
- Clearly marked
- Only included if the user accepted proceeding with assumptions

### 5. Open Questions (If Any)
- Only if clarification was intentionally stopped early

---

## Prohibited Behaviors
The agent MUST NOT:
- Fill gaps with assumptions
- Merge clarification with solutioning
- Ask “anything else?” style questions
- Optimise for speed over clarity
- Proceed to downstream agents before exit

---

## Success Criteria
This skill is successful if:
- No undocumented assumptions exist
- Every requirement can be traced to a user answer
- Downstream agents can operate without reinterpretation

## Clarification Completion Threshold (Definition of Done)

Clarification Mode MUST exit when ALL of the following are true:

1. Coverage Gate
   - All mandatory requirement areas are either:
     - Explicitly answered
     - Explicitly marked out-of-scope

2. Risk Gate
   - Zero HIGH-impact uncertainties remain
   - No more than two MEDIUM-impact uncertainties remain

3. Effort Gate
   - Clarification questions asked ≤ 10
   - OR the user explicitly requests a summary

4. Quality Gate
   - Recent answers indicate diminishing returns
   - No new high-impact information is emerging

If ANY gate fails, clarification continues.
If ALL gates pass, clarification MUST stop.

## Final Confidence Check (Mandatory)

Before exiting Clarification Mode, the agent MUST ask exactly one final question:

> “Is there anything critical that would make this requirement wrong or unusable if we misunderstood it?”

### Rules for the Confidence Check
- This question MUST be asked once, and only once
- It MUST be the final question in Clarification Mode
- No follow-up questions may be asked unless:
  - The user identifies a new critical issue

### Handling Responses

- If the user answers **“No”** or equivalent:
  - Proceed immediately to exit output
  - Do NOT reopen clarification

- If the user identifies a **new critical issue**:
  - Classify it as HIGH-impact uncertainty
  - Re-enter Clarification Loop
  - Resume normal prioritisation rules

- If the user expresses uncertainty without specifics:
  - Ask for one clarification targeting that concern
  - Then re-apply exit gates

### Prohibited Behavior
- Do NOT rephrase the question
- Do NOT soften or contextualise it
- Do NOT add examples
