# Personal Assistant

This project is a React + TypeScript + Vite app for a personal assistant Progressive Web App (PWA). It currently provides the application shell and route scaffolding for a lightweight planner that can grow into a cross-device assistant for daily organization.

## Current App Scope

The app includes a shared layout with navigation and placeholder screens for:

- Dashboard
- Tasks
- Journal
- Settings

The long-term product direction in [`docs/personal-assistant-pwa-plan.md`](/Users/karthick-5452/projects/assistant/docs/personal-assistant-pwa-plan.md) also covers expenses, reminders, notes, and cloud sync.

## Tech Stack

- React 19
- TypeScript
- Vite
- React Router
- `vite-plugin-pwa` for service worker and manifest generation

## How To Run

### Prerequisites

- Node.js 20+ recommended
- npm

### Install dependencies

```bash
npm install
```

### Start the development server

```bash
npm run dev
```

By default, Vite will print a local URL such as `http://localhost:5173`.

### Build for production

```bash
npm run build
```

### Preview the production build

```bash
npm run preview
```

### Run lint checks

```bash
npm run lint
```

## PWA Notes

The app is configured with `vite-plugin-pwa` and registers its service worker automatically. The current manifest uses the app name `Personal Assistant PWA` and is set up for standalone installation.

## Project Structure

```txt
src/
  App.tsx         app shell and navigation
  main.tsx        router setup and PWA registration
  App.css         shell styles
  index.css       global styles
docs/
  personal-assistant-pwa-plan.md
```

## Status

This repository is at the scaffold stage. The routing, layout, and PWA wiring are in place, while the feature modules still need their actual data models, forms, and persistence.
