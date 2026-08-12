#!/usr/bin/env bash
#
# Publish generated test-case artifacts to the Generated-Test-Cases repo.
# Usage: bash scripts/publish.sh US-001
#
# Commits every file under Generated-Test-Cases/ and pushes to:
#   https://github.com/yuliabalakis/Generated-Test-Cases.git
#
set -euo pipefail

STORY_ID="${1:-US-001}"
REMOTE_URL="https://github.com/yuliabalakis/Generated-Test-Cases.git"

# Resolve the repository root (directory containing this script's parent).
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

cd "${REPO_ROOT}"

# Initialize the git repo if it does not exist yet.
if [ ! -d .git ]; then
  git init -b main
fi

git config user.name  "yuliabalakis"
git config user.email "yuliabalakis@users.noreply.github.com"

# Ensure the origin remote is configured (ignore error if already set).
if ! git remote | grep -qx origin; then
  git remote add origin "${REMOTE_URL}"
elif [ "$(git remote get-url origin)" != "${REMOTE_URL}" ]; then
  git remote set-url origin "${REMOTE_URL}"
fi

git add .

if git diff --cached --quiet; then
  echo "No changes to commit for ${STORY_ID}."
else
  git commit -m "AI: Generate test cases for ${STORY_ID}"
fi

# Push (use --set-upstream on first push).
if git rev-parse --verify --quiet main >/dev/null 2>&1; then
  git push -u origin main
else
  git branch -M main
  git push -u origin main
fi

echo "✅ Published ${STORY_ID} to ${REMOTE_URL}"
echo "   commit: $(git rev-parse HEAD)"