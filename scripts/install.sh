#!/usr/bin/env bash
# Install ALL skills from the 1st-skills repo into Claude Code.
# Clones the repo to a stable location, then symlinks every skill
# (any <category>/<skill>/ that contains a SKILL.md) into ~/.claude/skills/.
set -euo pipefail

REPO_URL="${FIRST_SKILLS_REPO:-https://github.com/Sightless21/1st-skills.git}"
CACHE_DIR="$HOME/.cache/1st-skills"
SKILLS_DIR="$HOME/.claude/skills"

command -v git >/dev/null 2>&1 || { echo "error: git is required" >&2; exit 1; }

# Clone or update the repo.
if [[ -d "$CACHE_DIR/.git" ]]; then
  git -C "$CACHE_DIR" pull --ff-only
else
  rm -rf "$CACHE_DIR"
  git clone --quiet "$REPO_URL" "$CACHE_DIR"
fi

mkdir -p "$SKILLS_DIR"

# Find every skill: a directory containing a SKILL.md, at any depth.
found=0
while IFS= read -r skill_md; do
  skill_dir="$(dirname "$skill_md")"
  skill_name="$(basename "$skill_dir")"
  dest="$SKILLS_DIR/$skill_name"

  # Skip if a skill with the same name is already installed.
  if [[ -e "$dest" || -L "$dest" ]]; then
    echo "skip  $skill_name (already installed at $dest)"
    continue
  fi

  ln -s "$skill_dir" "$dest"
  echo "link  $skill_name -> $skill_dir"
  found=$((found + 1))
done < <(find "$CACHE_DIR" -name SKILL.md -not -path '*/.git/*')

if [[ $found -eq 0 ]]; then
  echo "No new skills installed."
fi

echo ""
echo "Start a NEW Claude Code session (skills load at startup)."
echo "Re-run this script after a repo update to pick up new skills."
