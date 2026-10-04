# 1st-skills

A collection of [Claude Code](https://claude.com/claude-code) skills, organized by category.

## Categories

| Category | Skills |
| --- | --- |
| **productivity** | [`meta-learning`](./productivity/meta-learning) — active-learning coach (Socratic questioning, quizzes, Feynman recall, flashcards) |

## Installing a skill

**Recommended — `npx` / `bunx` (per skill):**

```sh
npx @sightless21/meta-learning
# or
bunx @sightless21/meta-learning
```

**Or install everything from this repo (git):**

```sh
./install.sh
```

This clones the repo and symlinks every skill into `~/.claude/skills/`.

Then **start a new Claude Code session** (skills load at session start).

## Adding a skill

1. Create a category folder if needed: `productivity/`, `coding/`, `writing/`, …
2. Put the skill in `<category>/<skill-name>/` with a `SKILL.md` at that level.
3. If it ships as an npm package, keep `package.json` + `bin/install.js` inside the skill folder.
4. Add a row to the table above.
