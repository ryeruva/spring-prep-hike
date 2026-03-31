#!/bin/bash
# ─────────────────────────────────────────────────────────────────────────────
# sync.sh — Spring Prep Hike · Auto-sync Downloads → GitHub
# Usage: ./sync.sh
# Only commits files that are actually newer than the repo version.
# ─────────────────────────────────────────────────────────────────────────────

REPO_DIR="$HOME/Desktop/spring-prep-hike"
DOWNLOADS="$HOME/Downloads"

FILES=(
  "Spring_Prep_Hike_Menu.html"
  "Spring_Prep_Hike_Menu_Allergy_Scout.html"
  "Spring_Prep_Hike_Expenses.html"
  "Spring_Prep_Hike_Meal_Plan.xlsx"
  "Spring_Prep_Hike_Crew_Menu.md"
  "Spring_Prep_Hike_Master_Prompt.md"
  "Spring_Prep_Hike_Bear_Can_Packing.html"
  "Point_Reyes_Expenses.html"
  "Budget_Tracker.html"
  "Spring_Prep_Hike_Itinerary.html"
  "High_Sierra_Itinerary.html"
)

# ── colours ───────────────────────────────────────────────────────────────────
GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; NC='\033[0m'
ok()   { echo -e "  ${GREEN}✓${NC} $1"; }
warn() { echo -e "  ${YELLOW}⚠${NC}  $1"; }
err()  { echo -e "  ${RED}✗${NC} $1"; }

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Spring Prep Hike — GitHub Sync"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# ── sanity checks ─────────────────────────────────────────────────────────────
if [ ! -d "$REPO_DIR/.git" ]; then
  err "Repo not found at $REPO_DIR"
  err "Clone it first: git clone https://github.com/ryeruva/spring-prep-hike ~/Desktop/spring-prep-hike"
  exit 1
fi

cd "$REPO_DIR" || exit 1

echo "📡 Pulling latest from GitHub..."
git pull --quiet origin main && ok "Up to date with remote" || warn "Pull had issues — continuing anyway"
echo ""

echo "🔍 Checking files in Downloads..."
echo ""

COPIED=0; SKIPPED=0; MISSING=0

for f in "${FILES[@]}"; do
  SRC="$DOWNLOADS/$f"
  DST="$REPO_DIR/$f"

  if [ ! -f "$SRC" ]; then
    warn "$f — not found in Downloads (skipping)"
    ((MISSING++)); continue
  fi

  if [ ! -f "$DST" ]; then
    cp "$SRC" "$DST"
    ok "$f — added (new file)"
    ((COPIED++)); continue
  fi

  SRC_MOD=$(stat -f "%m" "$SRC" 2>/dev/null || stat -c "%Y" "$SRC")
  DST_MOD=$(stat -f "%m" "$DST" 2>/dev/null || stat -c "%Y" "$DST")

  if [ "$SRC_MOD" -gt "$DST_MOD" ]; then
    if ! cmp -s "$SRC" "$DST"; then
      cp "$SRC" "$DST"
      ok "$f — updated (newer version found)"
      ((COPIED++))
    else
      ok "$f — same content, skipping"
      ((SKIPPED++))
    fi
  else
    warn "$f — repo version is same age or newer, skipping"
    ((SKIPPED++))
  fi
done

echo ""
echo "  Summary: $COPIED updated · $SKIPPED unchanged · $MISSING missing"
echo ""

git add .

if git diff --cached --quiet; then
  echo "✅ Nothing to commit — GitHub is already up to date."
  echo ""; exit 0
fi

CHANGED_FILES=$(git diff --cached --name-only | tr '\n' ', ' | sed 's/,$//')
TIMESTAMP=$(date '+%b %d %Y · %H:%M')
COMMIT_MSG="Update: $CHANGED_FILES — $TIMESTAMP"

echo "📦 Committing changes..."
git commit -m "$COMMIT_MSG" --quiet
ok "Committed: $COMMIT_MSG"

echo ""
echo "🚀 Pushing to GitHub..."
if git push origin main --quiet; then
  echo ""
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo -e "  ${GREEN}✅ Done! Live in ~60 seconds at:${NC}"
  echo ""
  echo "  https://ryeruva.github.io/spring-prep-hike/Spring_Prep_Hike_Menu.html"
  echo "  https://ryeruva.github.io/spring-prep-hike/Spring_Prep_Hike_Menu_Allergy_Scout.html"
  echo "  https://ryeruva.github.io/spring-prep-hike/Spring_Prep_Hike_Expenses.html"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo ""
else
  err "Push failed — check your GitHub credentials"
  err "Run: git push origin main  (to see the full error)"
  exit 1
fi
