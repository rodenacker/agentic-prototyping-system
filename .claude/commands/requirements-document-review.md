# /requirements-document-review

## Description
Run a structured review of a requirements document against rules and framework guidance.  
This command invokes the **requirements-review skill** and produces a **machine-readable JSON report** highlighting:

- Rule violations
- Internal redundancies
- Conciseness opportunities
- Duplications with `docs/framework-docs/2-requirements.md`
- Overall assessment of document readiness

This is a **review-only command**: it does **not** modify documents or introduce new requirements.

---

## Skill
requirements-review.md

---

## Preconditions
Before running `/requirements-document-review`:

- A requirements document must exist (`business` or `prototype` requirements)
- Optional: access to `docs/framework-docs/2-requirements.md` for framework duplication checks

If inputs are missing, the command will **report the missing preconditions** instead of executing.

---

## Inputs
- `requirementsDocument` (string) — content of the document to review  
- `frameworkDocument` (string, optional) — content of the 2-requirements framework document

The invoking agent supplies these inputs; the user does **not** need to provide anything manually.

---

## Outputs
A **machine-readable JSON report**:

```json
{
  "ruleViolations": [
    {"section": "Section Name", "rule": "Rule description", "description": "Explanation"}
  ],
  "redundancies": [
    {"sections": ["Section1", "Section2"], "description": "Duplicate or overlapping content"}
  ],
  "concisenessOpportunities": [
    {"section": "Section Name", "description": "Where content could be tightened"}
  ],
  "frameworkDuplications": [
    {"section": "Section Name", "reference": "Reference to framework document"}
  ],
  "overallAssessment": "Clean | Minor issues | Blocking issues"
}
