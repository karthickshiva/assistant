# Personal Assistant PWA Plan (Firebase + Cross-Device)

## 1) Product goals
Build a simple, friendly, installable Progressive Web App (PWA) that works well on mobile and desktop and syncs data across devices.

### Core modules (MVP)
- Expense management
- Task management
- Reminder handling
- Notes
- Personal journal

### Non-functional goals
- Very lightweight front end (no heavy UI framework)
- Reusable and configurable code structure
- Modular design so new features can be added later
- Cloud-synced data using Firebase

## 2) Recommended stack (minimal + scalable)

### Frontend
- Vanilla TypeScript + Vite
- Web Components for reusable UI pieces (or plain component modules)
- CSS variables + small utility classes for minimal, themeable UI

### Backend (Firebase)
- Firebase Authentication (Email/Google)
- Cloud Firestore (main database)
- Firebase Cloud Functions (optional: reminder scheduling, automation)
- Firebase Hosting (PWA hosting)
- Firebase Cloud Messaging (optional future push reminders)

Why Firestore:
- Realtime sync and offline persistence
- Multi-device access with the same account
- Flexible schema for adding modules over time

## 3) High-level architecture

### Client-first modular architecture
- `core/`
  - app shell, routing, auth guard, theme, shared types
- `shared/`
  - reusable UI components, form utilities, date/validation helpers
- `modules/`
  - `expenses/`, `tasks/`, `reminders/`, `notes/`, `journal/`
  - each module owns: view, service, model, validators
- `platform/firebase/`
  - firebase init, auth adapter, firestore adapter, converter helpers

### Reusability rules
- Each module exposes a small public API (`create`, `update`, `remove`, `list`, `watch`)
- UI reads from module services, not directly from Firebase SDK
- Shared form/input/list components to avoid duplication
- Configuration-driven metadata for categories, priorities, mood tags, etc.

## 4) Firestore data model (simple and extensible)
Use per-user namespaced collections:

- `users/{uid}/expenses/{expenseId}`
- `users/{uid}/tasks/{taskId}`
- `users/{uid}/reminders/{reminderId}`
- `users/{uid}/notes/{noteId}`
- `users/{uid}/journalEntries/{entryId}`
- `users/{uid}/settings/profile`

Each document has common fields:
- `createdAt`, `updatedAt` (server timestamps)
- `archived` (optional soft delete)
- module-specific properties

Example: `tasks`
- `title`, `description`, `priority`, `status`, `dueAt`, `tags`, `completedAt`

Example: `expenses`
- `amount`, `currency`, `category`, `paidAt`, `paymentMethod`, `note`

## 5) Security and multi-device sync

### Authentication
- Start with Email+Password or Google sign-in
- Require auth for all private data screens

### Firestore security rules
- Users can read/write only under `users/{uid}` where `request.auth.uid == uid`
- Validate expected document fields for each collection
- Deny unknown top-level write paths by default

### Offline and sync behavior
- Enable Firestore offline persistence
- UI should display sync state (saved/syncing/error)
- Conflict handling strategy: last-write-wins for MVP

## 6) Friendly UX guidelines (minimal)
- Dashboard with quick actions: add task, add expense, add note, journal today
- Single primary accent color, calm neutral palette, large tap targets
- Bottom navigation on mobile; sidebar/top nav on desktop
- Fast add forms with sensible defaults (today date, common categories)
- Empty states that suggest a first action
- Search + filter at module level

## 7) Reminders approach (simple to advanced)

### MVP
- In-app reminders based on due dates/times in Firestore
- Browser notifications when app is open (permission-based)

### Next step
- Cloud Function + scheduler for reliable server-side reminder triggers
- Optional push notifications via FCM for background delivery

## 8) Extensibility strategy
- Module registry pattern:
  - new module registers routes, nav item, Firestore collection name, permissions, and UI components
- Shared CRUD service factory:
  - reduces boilerplate for future modules (e.g., habits, goals, reading list)
- Central config:
  - feature flags, labels, defaults, category lists

## 9) Build phases

### Phase 1: Foundation (Week 1)
- App shell, routing, auth flow
- Firebase init + Firestore adapters
- Shared design tokens and base components

### Phase 2: Core modules (Week 2-3)
- Expenses, Tasks, Notes, Journal CRUD + list/filter/search
- Basic dashboard aggregation cards

### Phase 3: Reminders + PWA polish (Week 4)
- Reminder model + notification permission flow
- Service worker + manifest + install UX
- Responsive/accessibility improvements

### Phase 4: Hardening (Week 5)
- Firestore security rules validation
- Error states, retries, and offline UX improvements
- Lightweight analytics (optional)

## 10) Suggested repository structure

```txt
src/
  core/
    app-shell/
    router/
    auth/
    config/
  shared/
    components/
    styles/
    utils/
  modules/
    expenses/
    tasks/
    reminders/
    notes/
    journal/
  platform/
    firebase/
      app.ts
      auth.ts
      firestore.ts
      converters.ts
  main.ts
firebase/
  firestore.rules
  firestore.indexes.json
public/
  manifest.webmanifest
```

## 11) Practical simplicity checklist
- Keep dependencies minimal and intentional
- Prefer small utility functions over abstraction-heavy patterns
- Keep each module independent and testable
- Use typed interfaces for all entities and service contracts
- Start with one environment (prod), add staging later only if needed

This plan gives you simple implementation today while keeping a clean path for future modules and cross-device growth.
