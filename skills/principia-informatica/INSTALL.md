# Installing the Principia Informatica skill

The skill is a single portable folder (`skills/principia-informatica/`) that follows the [Agent Skills](https://agentskills.io) open standard. The same folder works across every skills-compatible tool. Only the install location differs per tool.

Below, `SKILL_SRC` is the path to this folder in the repo:

```bash
SKILL_SRC="$(pwd)/skills/principia-informatica"   # run from the repo root
```

## Claude Code / Claude.ai / Claude Desktop

Personal (available in all your projects):

```bash
cp -r "$SKILL_SRC" ~/.claude/skills/principia-informatica
```

Project-scoped (only this repo):

```bash
mkdir -p .claude/skills
cp -r "$SKILL_SRC" .claude/skills/principia-informatica
```

The skill loads automatically when a task matches its description. You can also invoke it manually with `/principia-informatica`.

## OpenAI Codex CLI

```bash
mkdir -p .agents/skills
cp -r "$SKILL_SRC" .agents/skills/principia-informatica
```

## Cursor, GitHub Copilot / VS Code, Gemini CLI, and other skills-compatible tools

Each reads the same `SKILL.md` from its own skills directory. Check the tool's docs for the exact path, then copy the folder there. The Agent Skills client list is at https://agentskills.io/clients.

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

Then re-copy the skill folder to wherever it is installed. Never edit `references/propositions.md` directly; the next regeneration would overwrite the change.
