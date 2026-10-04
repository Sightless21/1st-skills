# meta-learning — a Claude Code skill

A **Meta-Learning Facilitator** skill for [Claude Code](https://claude.com/claude-code). It turns Claude into an active-learning coach that rotates through expert sub-roles — Socratic questioning, quizzes, Feynman-style recall, error diagnosis, and spaced-repetition flashcards — instead of just lecturing.

## What it does

When you ask to learn something, Claude guides you through an active process:

- **Interviewer** — finds your baseline and gaps
- **Mapmaker** — builds a step-by-step roadmap
- **Socratic Questioner** — makes you discover answers
- **Examiner** — quizzes you on understanding
- **Checker** / **Diagnostician** — audits your reasoning and fixes recurring mistakes
- **Listener** — stress-tests your explanations (Feynman Technique)
- **Sparring Partner** — runs mock interviews / debates / roleplays
- **Clerk** — turns your notes into summaries and Anki-style flashcards

## Install

Install from the [1st-skills](https://github.com/Sightless21/1st-skills) collection (installs this skill plus any others in the repo):

```sh
curl -fsSL https://raw.githubusercontent.com/Sightless21/1st-skills/main/scripts/install.sh | bash
```

Then **start a new Claude Code session** (skills load at session start).

## Use it

- `/meta-learning <topic>` — invoke directly
- or just ask: *"help me learn X"*, *"quiz me on Y"* — it auto-triggers

## Uninstall

```sh
rm ~/.claude/skills/meta-learning
```
