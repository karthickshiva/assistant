#!/usr/bin/env bash
set -euo pipefail

# Creates milestones and a starter set of issues using GitHub CLI.
# Prereqs:
#   - gh installed and authenticated
#   - run inside a git repo with origin set to GitHub

if ! command -v gh >/dev/null 2>&1; then
  echo "ERROR: gh CLI is not installed."
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "ERROR: gh CLI is not authenticated. Run: gh auth login"
  exit 1
fi

repo=$(gh repo view --json nameWithOwner -q .nameWithOwner)
echo "Using repo: $repo"

create_milestone () {
  local title="$1"
  local desc="$2"
  if gh api -X GET "repos/$repo/milestones" --paginate --jq '.[].title' | grep -Fxq "$title"; then
    echo "Milestone exists: $title"
  else
    gh api -X POST "repos/$repo/milestones" -f title="$title" -f description="$desc" >/dev/null
    echo "Created milestone: $title"
  fi
}

create_issue () {
  local title="$1"
  local body="$2"
  local milestone="$3"
  local labels="$4"

  if gh issue list --search "$title in:title" --state all --json title -q '.[].title' | grep -Fxq "$title"; then
    echo "Issue exists: $title"
  else
    gh issue create --title "$title" --body "$body" --milestone "$milestone" --label "$labels" >/dev/null
    echo "Created issue: $title"
  fi
}

create_milestone "M1 — Foundation and Project Setup (Week 1)" "Establish app shell, Firebase baseline, and reusable UI foundations."
create_milestone "M2 — Core Modules (Weeks 2-3)" "Deliver CRUD and list/search UX for expenses, tasks, notes, and journal."
create_milestone "M3 — Reminders and PWA Polish (Week 4)" "Ship reminders, installability, and responsive/accessibility polish."
create_milestone "M4 — Hardening and Release Readiness (Week 5)" "Validate security rules, resilience, and release quality checks."

create_issue "Initialize Vite + TypeScript PWA skeleton" $'- Vite TS app initializes and runs locally\n- Base routing and app shell layout present\n- Build output generated without errors' "M1 — Foundation and Project Setup (Week 1)" "type:chore,area:core,priority:p0"
create_issue "Set up Firebase project configuration and env handling" $'- Firebase app initialized from environment config\n- Dev/prod config documentation available\n- Missing config states handled gracefully' "M1 — Foundation and Project Setup (Week 1)" "type:chore,area:firebase,priority:p0"
create_issue "Implement authentication baseline (Email/Google)" $'- User can sign in/out\n- Protected routes require auth\n- Auth state persists across refresh' "M1 — Foundation and Project Setup (Week 1)" "type:feature,area:firebase,priority:p0"

echo "Done. Create remaining issues using docs/github-milestones-and-issues.md"
