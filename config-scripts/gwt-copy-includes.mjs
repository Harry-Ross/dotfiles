#!/usr/bin/env node
// Copies the files listed in <source>/.worktreeinclude into <destination>.
// Used by the `gwt add` shell function to carry untracked local files
// (.env, local configs, ...) into a freshly created git worktree.
//
// Usage: gwt-copy-includes.mjs <source-worktree> <destination-worktree>

import { cpSync, existsSync, globSync, mkdirSync, readFileSync } from "node:fs";
import { dirname, join } from "node:path";

const [source, destination] = process.argv.slice(2);

if (!source || !destination) {
  console.error(
    "usage: gwt-copy-includes <source-worktree> <destination-worktree>",
  );
  process.exit(2);
}

const includeFile = join(source, ".worktreeinclude");
if (!existsSync(includeFile)) process.exit(0);

// One pattern per line. `#` starts a comment, blank lines and trailing
// slashes are ignored. Patterns are globs relative to the source worktree.
const patterns = readFileSync(includeFile, "utf8")
  .split("\n")
  .map((line) => line.replace(/#.*/, "").trim().replace(/\/+$/, ""))
  .filter(Boolean);

let copied = 0;

for (const pattern of patterns) {
  const matches = globSync(pattern, { cwd: source });

  if (matches.length === 0) {
    console.error(`gwt: no match for '${pattern}'`);
    continue;
  }

  for (const match of matches) {
    try {
      mkdirSync(join(destination, dirname(match)), { recursive: true });
      cpSync(join(source, match), join(destination, match), {
        recursive: true,
      });
      console.log(`  + ${match}`);
      copied++;
    } catch (error) {
      console.error(`gwt: could not copy '${match}': ${error.message}`);
    }
  }
}

if (copied > 0) {
  console.log(`gwt: copied ${copied} item(s) from .worktreeinclude`);
}
