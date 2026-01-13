# CSS Guidelines for Prototypes

This document outlines the CSS architecture, patterns, and rules for prototypes. Adjust the colors and fonts used for generated prototypes to match the styling of the reference website provided.

---

## Critical CSS Rules

### ⚠️ MUST FOLLOW

1. **Shared CSS Files Only**
   - ALL CSS MUST be written to shared CSS files in `prototypes/shared/styles/`
   - Prototypes may NOT have their own CSS files
   - All prototypes MUST reference and use shared CSS files
   - Component styles, layouts, and utilities must all be defined in shared CSS
   - Prototypes only contain HTML/JSX structure and JavaScript functionality

2. **CSS Variables Required**
   - ALL colors, spacings, sizings, paddings, margins, and common values MUST be CSS variables
   - Never use hard-coded values in component styles
   - Always reference CSS variables

3. **Semantic Naming Only**
   - Only semantic variable names and class names allowed
   - Examples: `.primary-button`, `.hero-section` ✅
   - NOT: `.red-button`, `.bg-green` ❌
   - CSS class names describe purpose and meaning, not appearance

4. **No Inline Styles**
   - Inline styling is strictly forbidden
   - All styles must be in CSS files
   - No `style` attributes allowed in JSX/HTML elements

5. **No !important**
   - Use of `!important` is strictly prohibited in all CSS code

6. **No CSS Frameworks**
   - No Tailwind, Bootstrap, or other CSS frameworks
   - Only plain CSS with CSS Variables

---

## CSS Variables (Custom Properties)

### Variable Definition Location

CSS variables are defined in the `:root` selector:

```css
/*Example CSS*/

:root {
  /* Color variables */
  --color-primary: #376eb4;
  --color-secondary: #5788c8;

  /* Spacing variables */
  --spacing-xs: 4px;
  --spacing-sm: 6px;

  /* Font variables */
  --font-family-base: 'Sarabun', system-ui, sans-serif;
  --font-size-base: 14px;
}
```

### Variable Naming Convention

Use kebab-case with descriptive prefixes:

```css
/*Example CSS*/

/* Colors */
--color-{name}
--bg-{name}
--text-{name}
--border-{name}

/* Spacing */
--spacing-{size}
--padding-{size}
--margin-{size}
--gap-{size}

/* Typography */
--font-family-{name}
--font-size-{size}
--font-weight-{weight}
--line-height-{name}

/* Sizing */
--size-{name}
--width-{name}
--height-{name}

/* Borders */
--border-radius-{size}
--border-width-{size}

/* Shadows */
--shadow-{name}

/* Transitions */
--transition-{name}
```

### Usage Example

#### ✅ CORRECT - Using Variables

```css
.card {
  padding: var(--padding-sm);
  background-color: var(--bg-card);
  border-radius: var(--border-radius-base);
  gap: var(--gap-sm);
  transition: var(--transition-base);
}

.card:hover {
  box-shadow: var(--shadow-hover);
}
```

### Variable Rules

1. **ALL colors must be variables** - No hex codes, rgb(), or named colors in component styles
2. **ALL spacing must be variables** - No hard-coded pixel values for padding, margin, gap
3. **ALL typography must be variables** - Font families, sizes, weights, line heights
4. **ALL sizing must be variables** - Widths, heights, max-widths for common values
5. **ALL transitions must be variables** - Reuse common transition patterns
6. **Define once, use everywhere** - If a value repeats more than once, make it a variable
7. **Semantic naming** - Use purpose-based names (--btn-primary-bg) not value-based (--blue-500)

---

## Typography System

### Font Sizing Scale

| Element | Size | Line Height |
|---------|------|-------------|
| Body text | 14px | 1.5 |
| Small text | 12px | 1.1 |
| Headings | 16px | 1.1 |
| Buttons | 14px | 1.1 |
| Button large | 16px | 1.1 |
| Button small | 12px | 1.1 |

### Typography Rules

```css
/* Headings */
h1, h2, h3, h4 {
  line-height: 1.1;
  text-wrap: balance;
}

/* Interactive elements */
button, input, label {
  line-height: 1.1;
}

/* Body */
body {
  line-height: 1.5;
}
```

---

## Spacing System

### Primary Spacing Units

Use CSS variables consistently throughout the application:

- **var(--spacing-xs)** - Minimal spacing (typically 4px)
- **var(--spacing-sm)** - Standard small spacing (typically 6px)
- **var(--spacing-md)** - Button padding (typically 8px)
- **var(--spacing-lg)** - Standard medium spacing (typically 12px)
- **var(--spacing-xl)** - Large spacing (typically 16px)

### Gap Pattern

```css
/* Standard component gaps */
gap: var(--gap-sm);                    /* Small gaps */
gap: var(--gap-xs) var(--gap-md);      /* Vertical small, Horizontal medium */
gap: var(--gap-md);                    /* Medium gaps */
```

### Border Radius

**Standard**: `border-radius: var(--border-radius-base);`

---

## Component Naming Conventions

### Structure-Based Classes

```css
/* Layout containers */
.topbar          /* Top navigation bar */
.content         /* Main content area */
.card            /* Card container */
.modal           /* Modal overlay content */

/* Form elements */
.form-element           /* Base form element styling */
.form-element-container /* Form field wrapper */
```

### BEM-Inspired Modifier Pattern

```css
/* Block */
.button

/* Block with variant modifier */
.button-primary
.button-secondary
.button-destructive
.button-outline
.button-ghost
.button-link

/* Block with size modifier */
.button-sm
.button-lg
.button-icon

/* Element state modifiers */
.form-element-border
.form-element-focus
.form-element-error
.form-element-placeholder
.form-element-text
```

### Naming Rules

1. Use **lowercase with hyphens** (kebab-case)
2. Use **semantic names** that describe purpose, not appearance
3. Use **modifiers** for variants (size, state, style)
4. Avoid **abbreviations** unless universally understood (btn → button)

---

## Button System

### Button Variants

| Class | Purpose |
|-------|---------|
| `.button-primary` | Main actions |
| `.button-secondary` | Alternative actions |
| `.button-destructive` | Delete/remove |
| `.button-outline` | Secondary outline |
| `.button-ghost` | Tertiary actions |
| `.button-link` | Text-only button |

### Button Sizes

```css
/* Default */
button {
  padding: var(--btn-padding-default);
  font-size: var(--font-size-base);
}

/* Small */
.button-sm {
  padding: var(--btn-padding-sm);
  font-size: var(--font-size-sm);
}

/* Large */
.button-lg {
  padding: var(--btn-padding-lg);
  font-size: var(--font-size-md);
}

/* Icon only */
.button-icon {
  padding: var(--spacing-sm);
  width: var(--size-icon-btn);
  height: var(--size-icon-btn);
  display: inline-flex;
  align-items: center;
  justify-content: center;
}
```

### Button States

```css
/* Base button */
button {
  border: none;
  cursor: pointer;
  font-family: inherit;
  border-radius: var(--border-radius-base);
  transition: var(--transition-base);
}

/* Hover animation */
button:hover:not(:disabled) {
  box-shadow: var(--shadow-hover);
  transform: var(--transform-hover);
}

/* Disabled state */
button:disabled {
  background-color: var(--btn-disabled-bg);
  color: var(--btn-disabled-text);
  cursor: not-allowed;
  border: none;
  box-shadow: none;
  transform: none;
}
```

---

## Form Elements

### Form Element Structure

```css
.form-element-container {
  display: inline-grid;
  gap: var(--gap-xs) var(--gap-md);
  grid-template-columns: auto auto;
}
```

### Input Styling Classes

```css
/* Base styling */
input, textarea, select {
  padding: var(--padding-input);
  border-radius: var(--border-radius-base);
  font-size: var(--font-size-base);
  width: 100%;
  max-width: var(--width-input-max);
  transition: var(--transition-border);
}

/* Border */
.form-element-border {
  border: var(--border-width-base) solid var(--border-primary);
}

/* Text color */
.form-element-text {
  color: var(--text-primary);
}

/* Placeholder */
.form-element-placeholder::placeholder {
  color: var(--text-placeholder);
}

/* Focus state */
.form-element-focus:focus {
  border-color: var(--border-focus);
  outline: none;
}

/* Error state */
.form-element-error {
  border: var(--border-width-base) solid var(--border-error);
}
```

---

## Layout & Grid Patterns

### Standard Grid Pattern

```css
.subGrid {
  display: grid;
  grid-auto-rows: auto;
  grid-column-gap: var(--gap-md);
  grid-row-gap: 0;
}
```

### Named Grid Areas Pattern

For complex layouts, use named grid areas:

```css
.pathListItem {
  grid-template-columns: 1fr 1fr 200px 40px;
  grid-template-areas: "operationPathContainer pathListItemIDContainer methodCol trashCol";
}

/* Child elements reference areas */
.operationPathContainer {
  grid-area: operationPathContainer;
}

.pathListItemIDContainer {
  grid-area: pathListItemIDContainer;
}

.methodCol {
  grid-area: methodCol;
}

.trashCol {
  grid-area: trashCol;
  align-self: end;
}
```

### Layout Rules

1. **Use CSS Grid** for complex layouts
2. **Named areas** for multi-column forms/tables
3. **Flexbox** for simple horizontal/vertical layouts
4. **Consistent gaps** - Use CSS variables (var(--gap-xs), var(--gap-sm), var(--gap-md))
5. **Responsive columns** - Use `1fr` for flexible columns

---

## Animation & UX Philosophy

### Design Aesthetic

- **Slick and modern** - Clean, professional appearance
- **Task-focused** - Prioritize business application efficiency
- **Professional interactions** - Suited for financial services users

### Animation Strategy

**Core Principles:**
- Use **subtle animations** that enhance usability and productivity
- Animations should **assist users** in understanding state changes and interface feedback
- **Avoid decorative or distracting** animations
- All animations must **respect accessibility** guidelines

**Standard Transition Timing:**
- **Duration**: `0.2s` (200ms)
- **Easing**: `ease`
- Example: `transition: var(--transition-base);`

**Common Transition Patterns:**
```css
:root {
  --transition-base: all 0.2s ease;
  --transition-border: border-color 0.2s ease, outline 0.2s ease;
}
```

**Button Hover Animation:**
```css
button:hover:not(:disabled) {
  box-shadow: var(--shadow-hover);
  transform: var(--transform-hover);
}
```

**Accessibility Requirement:**
- ⚠️ **CRITICAL**: Always consider `prefers-reduced-motion` for animations
- Never add animations without accessibility considerations

---

## Utility Classes

### Visibility Utilities

```css
.show {
  display: block;
}

.showinline {
  display: inline-block;
}

.showgrid {
  display: grid;
}

.hide {
  display: none;
}
```

### Positioning Utilities

```css
.floatright {
  float: right;
}

.positionrelative {
  position: relative;
}
```

---

## Component Template

Use this template when creating new components:

```css
/* ========================================
   Component Name
   ======================================== */

/* Component using CSS variables */
.my-component {
  padding: var(--padding-sm);
  background-color: var(--bg-card);
  color: var(--text-primary);
  border-radius: var(--border-radius-base);
  transition: var(--transition-base);
}

/* Hover state */
.my-component:hover:not(:disabled) {
  box-shadow: var(--shadow-hover);
  transform: translate(1px, -1px);
}

/* Disabled state */
.my-component:disabled {
  background-color: var(--btn-disabled-bg);
  color: var(--btn-disabled-text);
  cursor: not-allowed;
}

/* Variant: Primary */
.my-component-primary {
  background-color: var(--btn-primary-bg);
  color: var(--btn-primary-text);
}

/* Variant: Large */
.my-component-large {
  padding: var(--padding-lg);
  font-size: var(--font-size-md);
}
```
