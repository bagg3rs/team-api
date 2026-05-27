#!/bin/bash
# Push live stats PR

cd ~/.openclaw/workspace/team-api

echo "Refreshing GitHub auth with workflow scope..."
gh auth refresh -s workflow

echo "Pushing branch..."
git push origin add-live-stats-action

echo "Creating PR..."
gh pr create --title "Add live stats via GitHub Actions" \
  --body "Implements auto-generated team metrics (closes #2, closes #3):

**GitHub Action:**
- Runs hourly + on push + manual trigger
- Fetches real metrics from GitHub API
- Generates stats.json automatically

**Live Metrics:**
- Deployment frequency (workflow runs/day)
- Success rate
- PRs merged in last 30 days  
- Average PR merge time (MTTR proxy)
- Active contributors

**Page Updates:**
- Loads stats.json dynamically
- Shows 'Stats updated Xh ago' timestamp
- Graceful fallback if missing

Closes #2 (DORA metrics)
Closes #3 (Show the metrics)"

echo "Done!"
