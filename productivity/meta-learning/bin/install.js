#!/usr/bin/env node
// Installs the meta-learning skill into Claude Code.
// Copies SKILL.md from this package into ~/.claude/skills/meta-learning/.
// Dependency-free so `npx` / `bunx` runs fast.

const fs = require("fs");
const os = require("os");
const path = require("path");

const src = path.join(__dirname, "..", "SKILL.md");
const destDir = path.join(os.homedir(), ".claude", "skills", "meta-learning");
const dest = path.join(destDir, "SKILL.md");

if (!fs.existsSync(src)) {
  console.error(`error: SKILL.md not found at ${src}`);
  process.exit(1);
}

// Support --uninstall / -u
if (process.argv.includes("--uninstall") || process.argv.includes("-u")) {
  if (fs.existsSync(destDir)) {
    fs.rmSync(destDir, { recursive: true, force: true });
    console.log(`Removed ${destDir}`);
  } else {
    console.log("Not installed — nothing to remove.");
  }
  process.exit(0);
}

// Refuse to clobber a git clone or symlink the user made manually.
if (fs.lstatSync(destDir, { throwIfNoEntry: false })?.isSymbolicLink()) {
  console.error(
    `error: ${destDir} is a symlink (probably a manual install).\n` +
      `Remove it first: rm ${destDir}\n` +
      `Or uninstall with: npx @sightless21/meta-learning --uninstall`
  );
  process.exit(1);
}

fs.mkdirSync(destDir, { recursive: true });
fs.copyFileSync(src, dest);

console.log("Installed meta-learning skill for Claude Code.");
console.log(`  ${dest}`);
console.log("");
console.log("Start a NEW Claude Code session (skills load at startup), then:");
console.log("  /meta-learning <topic>");
console.log("");
console.log("Uninstall later with: npx @sightless21/meta-learning --uninstall");
