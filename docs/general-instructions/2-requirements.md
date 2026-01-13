# Technical Requirements

## Technology Stack

- **Framework**: React (standard setup)
- **Styling**: Plain CSS with CSS Variables
- **Development**: Modern browsers only (latest Chrome, Firefox, Safari, Edge)
- **Build Tool**: Standard React development tooling
- **No mobile-specific browsers required**

## Project Structure

```
prototypes/
  shared/
    components/     # Common React components
    styles/         # Common CSS files and CSS variables
    assets/         # Common images, icons, etc.
    utils/          # Common utility functions
  prototype-1/      # Individual prototype folders
  prototype-2/
  ...

docs/
  design-system/    # Design system documentation
  prototype-1/      # Prototype-specific documentation
    brief.md
    requirements.md
  prototype-2/
    brief.md
    requirements.md
  ...
```

## Common Framework Requirements

### Shared Component System

- **Styling Approach**: Plain CSS with CSS Variables
- All components will be styled using plain CSS files
- Identify components during prototype development
- Initial focus: components needed for first prototype only
- Components stored in `prototypes/shared/components/` directory
- **CRITICAL**: Prototypes **MUST** use shared components - NEVER copy components into prototype directories
- Shared components should be referenced via imports from `prototypes/shared/` to ensure consistency and maintainability
- When a component is created, all prototypes must be updated to use the component

### Design System

**Documentation Location**: `docs/design-system/`
- No technical implementation details in generated design system docs
- Focus on design decisions and usage guidelines

**CSS and Styling Requirements**:
- **CRITICAL**: Plain CSS with CSS Variables only - no frameworks (Tailwind, Bootstrap, etc.)
- **CRITICAL**: All CSS in `prototypes/shared/styles/` - prototypes should NOT have their own CSS files
- **CRITICAL**: No inline styles, no `!important`, semantic class names only
- **CRITICAL**: All colors, spacing, typography must use CSS variables - no hard-coded values
- See [design-system/css-guidelines.md](../design-system/css-guidelines.md) for complete CSS implementation details

**UX Design Philosophy**:
- Slick, modern, and task-focused user experience for business applications
- Subtle animations that enhance usability and productivity
- See [design-system/css-guidelines.md](../design-system/css-guidelines.md) for animation guidelines

**UI Interaction Requirements**:
- **CRITICAL**: JavaScript `alert()` and `confirm()` dialogs are strictly forbidden
- Create and use a custom confirmation dialog/message box system for user confirmations
- Create and use a toast notification system for user messages and feedback
- All user notifications must use these custom components to maintain consistent UX

**Icon Requirements**:
- **CRITICAL**: All icons MUST be generated as SVG (Scalable Vector Graphics) format
- SVG icons should be stored in `prototypes/shared/assets/` directory
- No raster image formats (PNG, JPG, etc.) for icons

### Branding and Styling

- Reference website will be provided before code development begins
- Follow color palette and general styling from reference website
- Professional financial services aesthetic

### Responsive Design

- **Breakpoints**: Standard (640px, 768px, 1024px, 1280px) defined as CSS variables
- Mobile/tablet/desktop support
- Custom CSS Grid system for layout
- CSS media queries for responsive behavior
- Responsive design principles throughout
- All responsive styles implemented using plain CSS

### Accessibility

- **Level**: Basic accessibility practices
- Semantic HTML
- Keyboard navigation
- Alt text for images
- ARIA labels where appropriate
- No formal WCAG compliance required

### Cross-Browser Compatibility

- Modern browsers only
- Latest versions of Chrome, Firefox, Safari, Edge
- No IE or legacy browser support

## Prototype-Specific Requirements

### Landing Page

- **REQUIRED**: Create a simple landing page with empty state placeholder at the root of the prototypes directory
- The initial landing page content is **only** an empty state placeholder
- The landing page is displayed when the dev server starts
- **CRITICAL**: When a new prototype is added, a link to it MUST be added to the landing page
- Landing page should be clean and professional, following the design system
- Each prototype link should include the prototype name and brief description

### Mock Data

- Inline mock data or simple JSON files
- Optimize for speed of development
- Financial services context for all mock data
- No complex data management infrastructure needed

### Documentation

- Brief: `docs/prototype-X/brief.md` (provided by user)
- Requirements: `docs/prototype-X/requirements.md` (generated after Q&A)

## Development Workflow

See [3-workflow.md](3-workflow.md) for complete workflow details.

## Testing and Validation

- **Type**: Visual/functional testing only
- **Method**: Manual testing by running prototype locally
- **No automated testing required**
- User tests and provides feedback
- Revision cycles after feedback

## Key Assumptions

1. Speed is priority - choose implementation approaches that deliver working prototypes quickly
2. Visual and functional consistency across prototypes is important
3. Prototypes are for demonstration and validation, not production use
4. Polish is important but don't over-engineer
5. Shared systems grow organically based on prototype needs
6. Reference website for branding will be provided before code development

## Out of Scope

- Production-ready code
- Comprehensive test coverage
- WCAG AA compliance
- Legacy browser support
- Individual prototype README files
- Backend integration
- Real data/API connections

