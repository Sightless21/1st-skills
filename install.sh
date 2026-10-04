#!/usr/bin/env bash
# Install the meta-learning skill into Claude Code.
# Clones this repo into ~/.claude/skills/meta-learning so SKILL.md
# lands at ~/.claude/skills/meta-learning/SKILL.md.
set -euo pipefail

# Edit this to your GitHub repo URL.
REPO_URL="${META_LEARNING_REPO:-https://github.com/Sightless21/meta-learning.git}"
SKILL_DST="$HOME/.claude/skills/meta-learning"

command -v git >/dev/null 2>&1 || { echo "error: git is required" >&2; exit 1; }

mkdir -p "$HOME/.claude/skills"

if [[ -e "$SKILL_DST" || -L "$SKILL_DST" ]]; then
  echo "Removing existing $SKILL_DST"
  rm -rf "$SKILL_DST"
fi

git clone "$REPO_URL" "$SKILL_DST"

if [[ ! -f "$SKILL_DST/SKILL.md" ]]; then
  echo "error: clone succeeded but $SKILL_DST/SKILL.md is missing" >&2
  exit 1
fi

echo "Installed: $SKILL_DST"
echo "Start a new Claude Code session to use it. Try: /meta-learning <topic>"
