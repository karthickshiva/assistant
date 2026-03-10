# GitHub Milestones and Tickets for Personal Assistant PWA

This backlog converts the implementation plan into execution-ready GitHub milestones and issues.

## Milestones

### M1 — Foundation and Project Setup (Week 1)
**Goal:** establish app shell, Firebase baseline, and reusable UI foundations.

### M2 — Core Modules (Weeks 2-3)
**Goal:** deliver CRUD and list/search UX for expenses, tasks, notes, journal.

### M3 — Reminders and PWA Polish (Week 4)
**Goal:** reminders, installability, and responsive/accessibility polish.

### M4 — Hardening and Release Readiness (Week 5)
**Goal:** security rules validation, resilience, and release checks.

---

## Issue templates (ready to create)

> Suggested labels: `type:feature`, `type:chore`, `type:docs`, `area:core`, `area:firebase`, `area:ux`, `area:module:<name>`, `priority:p0/p1/p2`.

## M1 — Foundation and Project Setup

1. **Initialize Vite + TypeScript PWA skeleton**
   - Labels: `type:chore`, `area:core`, `priority:p0`
   - Acceptance Criteria:
     - Vite TS app initializes and runs locally.
     - Base routing and app shell layout present.
     - Build output generated without errors.

2. **Set up Firebase project configuration and env handling**
   - Labels: `type:chore`, `area:firebase`, `priority:p0`
   - Acceptance Criteria:
     - Firebase app initialized from environment config.
     - Dev/prod config documentation available.
     - Missing config states handled gracefully.

3. **Implement authentication baseline (Email/Google)**
   - Labels: `type:feature`, `area:firebase`, `priority:p0`
   - Acceptance Criteria:
     - User can sign in/out.
     - Protected routes require auth.
     - Auth state persists across refresh.

4. **Create shared UI primitives (Button, Input, Modal, Toast)**
   - Labels: `type:feature`, `area:ux`, `priority:p1`
   - Acceptance Criteria:
     - Components are reusable and documented.
     - Keyboard navigation works.
     - Theme tokens applied consistently.

5. **Create Firestore adapter and typed service contracts**
   - Labels: `type:feature`, `area:firebase`, `area:core`, `priority:p0`
   - Acceptance Criteria:
     - CRUD adapter supports create/update/delete/list/watch.
     - Module services consume adapter (not raw SDK in views).
     - Shared entity base type includes timestamps.

6. **Define lint/format/test baseline and CI checks**
   - Labels: `type:chore`, `area:core`, `priority:p1`
   - Acceptance Criteria:
     - Lint and format scripts added.
     - Basic CI workflow runs lint + build.

## M2 — Core Modules

7. **Expenses module: CRUD + category filters + monthly total**
8. **Tasks module: CRUD + status workflow + due date filters**
9. **Notes module: CRUD + tags + quick search**
10. **Journal module: daily entry + mood tag + timeline list**
11. **Dashboard cards: today tasks, upcoming reminders, month spend**
12. **Global search scaffold across modules**
13. **Config-driven metadata (categories, priorities, moods)**
14. **Form validation and empty states for all MVP modules**

For issues 7-14 use labels: `type:feature`, `priority:p0|p1`, plus module area labels.

Acceptance Criteria baseline for each:
- Create/edit/delete/list supported.
- Loading/empty/error states included.
- Data persisted per authenticated user path in Firestore.

## M3 — Reminders and PWA Polish

15. **Reminders module CRUD with due time and repeat metadata**
16. **Browser notification permission flow + in-app trigger loop**
17. **PWA manifest, icons, and install prompt UX**
18. **Service worker caching strategy for shell assets**
19. **Responsive navigation (mobile bottom nav + desktop sidebar)**
20. **Accessibility pass (labels, focus order, contrast basics)**

Acceptance Criteria:
- App installable from supported browsers.
- Reminder notifications work while app is open.
- Core screens are usable on small and large viewports.

## M4 — Hardening and Release Readiness

21. **Write and validate Firestore security rules for user isolation**
22. **Add Firestore indexes for expected query patterns**
23. **Offline sync state indicators and retry UX**
24. **Backup/restore MVP (JSON export/import)**
25. **Release checklist and QA matrix (mobile + desktop browsers)**

Acceptance Criteria:
- Security rule tests cover read/write ownership constraints.
- Queries required by screens are indexed.
- User sees explicit syncing/saved/error statuses.

---

## Dependency order
- #1 → #2 → #3/#5 → #7-14 → #15-20 → #21-25

## Suggested milestone assignment map
- **M1:** #1-#6
- **M2:** #7-#14
- **M3:** #15-#20
- **M4:** #21-#25

## Priority order for immediate execution
1) #1, #2, #3, #5
2) #7, #8, #9, #10
3) #15, #17, #18
4) #21, #23, #25
