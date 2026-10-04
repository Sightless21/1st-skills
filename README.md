# 1st-skills

A collection of [Claude Code](https://claude.com/claude-code) skills, organized by category.

## Categories

| Category | Skills |
| --- | --- |
| **productivity** | [`meta-learning`](./productivity/meta-learning) — active-learning coach (Socratic questioning, quizzes, Feynman recall, flashcards) |

## Installing

Install every skill in this repo:

```sh
curl -fsSL https://raw.githubusercontent.com/Sightless21/1st-skills/main/scripts/install.sh | bash
```

This clones the repo to `~/.cache/1st-skills` and symlinks each skill into `~/.claude/skills/`. Re-run it after a repo update to pick up new skills.

Then **start a new Claude Code session** (skills load at session start).

## Adding a skill

1. Create a category folder if needed: `productivity/`, `coding/`, `writing/`, …
2. Put the skill in `<category>/<skill-name>/` with a `SKILL.md` at that level.
3. Add a row to the table above.
4. Any per-skill installer or helper scripts live in the top-level `scripts/` folder.
