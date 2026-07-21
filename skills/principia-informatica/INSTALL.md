# Installing the Principia Informatica skill

The skill is a single portable folder (`skills/principia-informatica/`) that follows the [Agent Skills](https://agentskills.io) open standard. The same folder works across every skills-compatible tool.

## Recommended: the `skills` CLI

One command, no clone required, using the [`skills`](https://github.com/vercel-labs/skills) CLI:

```bash
npx skills add FranDepascuali/principia-informatica
```

By default this installs into the current repo (`.claude/skills/`). Add `-g` to install it globally (`~/.claude/skills/`), available in all your projects:

```bash
npx skills add FranDepascuali/principia-informatica -g
```

The same command works across Claude Code, Cursor, Codex, GitHub Copilot / VS Code, Gemini CLI, and the other tools listed at https://agentskills.io/clients. Use `--list` to preview the skills in the repo before installing.

Once installed, the skill loads automatically when a task matches its description. You can also invoke it manually with `/principia-informatica`.

## ChatGPT (consumer app and Custom GPTs)

The ChatGPT app does not load `SKILL.md` folders. Port it manually:

1. Create a Custom GPT (or open a Project).
2. Paste the body of `SKILL.md` (everything below the frontmatter) into the **Instructions** field. Trim to fit the limit (about 8,000 characters for a Custom GPT).
3. Upload `references/propositions.md` as a **Knowledge** file so the propositions are searchable.

## Keeping the skill in sync

`references/propositions.md` is a generated bundle, not a hand-maintained file. The single source of truth is the repo's `propositions/` directory. After adding or amending a proposition, regenerate the bundle from the repo root:

```bash
scripts/build-skill-reference.sh
```

Then re-run `npx skills add FranDepascuali/principia-informatica` to pull the update wherever it is installed. Never edit `references/propositions.md` directly; the next regeneration would overwrite the change.
