# Prototype Development Workflow

Strictly follow these steps to set up the project and generate the prototypes.

---

## Section 1: Initial Project Setup (One-Time)

Complete these steps **once** at the beginning of the project, before generating any prototypes. Do not generate documents other than those defined in these instructions. 

### Steps Summary
1. Information gathering (Plan Mode)
2. Requirements Q&A (Plan Mode)
3. Requirements documentation (Plan Mode)
4. Design token extraction
5. Application setup & landing page creation (empty state)
6. Customer validation pass

### 1. Customer Research & Discovery

**Gather customer information via:**
- Customer website analysis
- Project brief and meeting notes

**Requirements Q&A:**
- Ask clarification questions one-by-one

**Requirements Documentation:**
- Organization, goals, and market context
- Business requirements and objectives
- Target users
- Don't repeat information already defined in the general instructions

**Output:** One project-specific requirements document only saved in `docs\project-setup\`

**Requirements Document Review:** Review the generated requirements document and and make sure it does not repeat any information already defined in the general instructions. The requirements document may refer to other documents where appropriate. 

**Crititcal:** Prompt the user to review the requirements document and approve it before continuing the workflow

### 2. Design Token Extraction

- Extract colors, fonts, and brand assets from customer website
- Create design tokens as CSS variables in `prototypes\shared\styles\`
- Set up shared CSS foundation with customer's design system

### 3. Application Setup

- Initialize React application in `prototypes\` folder
- Create shared systems structure (`shared\components\`, `shared\styles\`, `shared\assets\`, `shared\utils\`)
- Configure build tools and development environment
- Generate common landing page contaning an empty state placeholder

**Code Review:** Review the generated code to make sure it adheres to the rules in `docs\general-instructions\1-overview.md`, the requirements in `docs\general-instructions\2-requirements.md` and the CSS guidelines in `docs\design-system\css-guidelines.md`.

**Completion Criteria:**
- ✅ Customer business documented
- ✅ Project requirements created
- ✅ Design tokens extracted and stored
- ✅ Development environment ready
- ✅ Landing page created and verified

---

## Section 2: Prototype Generation (Repeatable)

Strictly follow these steps for each prototype/module you create.

### Steps Summary
1. Prototype brief and wireframe review (Plan Mode)
2. Requirements Q&A (Plan Mode)
3. Requirements documentation (Plan Mode)
4. Common features development
5. High-fidelity prototype build
6. Landing page update
7. Code Review
8. Customer validation pass

### 1. Brief & Wireframes Review (Plan Mode)

- Review brief in `docs\[module-name]\` and any wireframes provided
- Understand module purpose, features, and user flows

### 2. Requirements Q&A (Plan Mode)

- Clarify anything needed to create a clickable web application prototype
- Ask clarification questions one-by-one

### 3. Requirements Documentation (Plan Mode)

- Create a requirement document for each prototype based on brief, wireframes, and Q&A
- Include acceptance criteria
- Document any assumptions made
- Don't repeat information already defined in the general instructions
- Save to `docs\[module-name]\requirements.md`
- Stop after generating requirements document; do not create additional documents
- **Critical:** Prompt the user to review the document and provide feedback before proceeding to the next step

### 4. Common Features Development

- Create shared components in `prototypes\shared\components\`
- Add shared styling in `prototypes\shared\styles\`
- Build reusable utilities in `prototypes\shared\utils\`
- Ensure all new components use existing design tokens

### 5. High-Fidelity Prototype Build

- Create prototype-specific folder in `prototypes\[module-name]\`
- Generate UI screens using shared components and styling
- Assemble screens into fully clickable prototype
- Keep visuals clean and professional but don't over-polish
- Ensure all styling uses shared CSS (no module-specific stylesheets)

### 6. Landing Page Update

- Update the common landing page with link to new prototype
- Add prototype name and brief description
- Ensure navigation is clear and functional

### 7. Review

1. **Code Review:** Review the generated code to make sure it adheres to the rules in `docs\general-instructions\1-overview.md`, the requirements in `docs\general-instructions\2-requirements.md` and the CSS guidelines in `docs\design-system\css-guidelines.md`.
2. Cleanup temporary files that are no longer needed.
3. Check the location of documents to make sure they are logically named and in the correct folders.

### 8. Customer Validation Pass

- Add prototype to landing page for hands-on review
- User tests the prototype
- Capture issues reported by the user
- Fix issues in tightly scoped revision cycles

---

## Notes

- **First Prototype**: You'll create more shared components during the first prototype
- **Subsequent Prototypes**: Increasingly reuse existing shared components
- **Shared Systems Growth**: The component library grows organically with each prototype
- **One Revision Cycle**: Focus on one round of feedback and fixes per prototype
