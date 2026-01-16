# Skill: requirements-review

## Purpose
Review a requirements document against established rules and framework guidance, and report issues clearly and concisely.

This skill is **review-only**.
It enforces quality and consistency without altering intent.

---

## Scope

This skill applies to:
- Business requirements documents
- Prototype requirements documents

It is designed to be reusable by multiple agents.

---

## Inputs

The invoking agent must provide:
- The requirements document to be reviewed
- Access to framework documentation, specifically:
  - `docs/framework-docs/requirements.md`

The skill assumes the document already exists and is complete.

---

## Responsibilities

The skill MUST perform the following tasks:

1. **Apply Requirements Rules**
   - Locate and apply rules pertaining to requirement documents
   - Use `docs/framework-docs/requirements.md` as the authoritative reference

2. **Rule Compliance Check**
   - Compare the requirements document against the applicable rules
   - Identify any deviations or violations

3. **Redundancy Detection**
   - Identify internal redundancies within the document
   - Highlight repeated statements, duplicated intent, or overlapping sections

4. **Conciseness Opportunities**
   - Identify where content can be more concise **without changing meaning**
   - Focus on:
     - Wordiness
     - Repetition
     - Unnecessary qualifiers

5. **Framework Duplication Detection**
   - Identify content duplicated from `docs/framework-docs/requirements.md`
   - Recommend replacing duplicated content with references instead of repetition

---

## Prohibitions (CRITICAL)

The skill MUST NOT:

- Add new requirements
- Remove requirements
- Rewrite or edit the document
- Change meaning or intent
- Introduce assumptions
- Ask the user questions
- Negotiate trade-offs
- Resolve ambiguities

This skill reports findings only.

---

## Output

The skill MUST produce a **Requirements Review Report** containing the following sections:

### 1. Rule Violations
- List of rule breaches, if any
- Reference the specific rule where possible

### 2. Redundancies
- Bullet list of duplicated or overlapping content
- Reference section names or headings

### 3. Conciseness Opportunities
- Bullet list of sections or sentences that could be tightened
- Do NOT provide rewritten text — describe the issue only

### 4. Framework Duplications
- List of content duplicating `docs/framework-docs/requirements.md`
- Suggest replacement with references (do not draft the reference text)

### 5. Overall Assessment
- One of:
  - **Clean** (no material issues)
  - **Minor issues** (safe to proceed with small fixes)
  - **Blocking issues** (should be addressed before proceeding)

---

## Tone

- Direct
- Neutral
- Non-prescriptive
- Non-creative

No commentary, coaching, or opinions beyond the findings.

---

## Completion Rules

- Stop after producing the review report
- Do not modify files
- Do not suggest next steps unless explicitly asked by the invoking agent
