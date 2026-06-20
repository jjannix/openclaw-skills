<div align="center">

# OpenClaw Skills

*Community skills for [OpenClaw](https://github.com/openclaw/openclaw) — the extensible AI assistant.*

[![OpenClaw](https://img.shields.io/badge/OpenClaw-379k%20⭐-purple?style=flat&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMDAgMTAwIj48dGV4dCB5PSIuOWVtIiBmb250LXNpemU9IjkwIj7wn6SnPC90ZXh0Pjwvc3ZnPg==)](https://github.com/openclaw/openclaw)

</div>

Skills are instruction sets that teach OpenClaw agents how to handle specific tasks — from checking train delays to managing your Notion workspace. Each skill is self-contained and works out of the box.

## What's inside

| Skill | What it does | Needs |
|-------|-------------|-------|
| [bahn](./bahn/) | Deutsche Bahn connections, real-time delays, prices, Bahncard discounts | Chromium browser |
| [notion](./notion/) | Read, create, and manage Notion pages, databases, and blocks | Notion API key |
| [video-download](./video-download/) | Download videos from YouTube, Twitter/X, TikTok, Instagram via yt-dlp | yt-dlp |

More coming. Each skill is a folder with a `SKILL.md` (instructions the agent reads) and whatever scripts or references it needs.

## Quick start

```bash
git clone https://github.com/jjannix/openclaw-skills.git
cd openclaw-skills
cp -r <skill-name> ~/.openclaw/workspace/skills/
rm -rf openclaw-skills
```

OpenClaw discovers skills in its workspace automatically. If your agent doesn't pick up a new skill right away, just tell it:

> "I installed the bahn skill. You can now check Deutsche Bahn connections and delays."

It'll read the `SKILL.md` and know exactly what to do.

## What's a skill, technically

A skill is just a folder with:

```
skill-name/
├── SKILL.md          # Instructions the agent reads
├── scripts/          # Optional helper scripts
└── references/       # Optional API docs, data files
```

The `SKILL.md` is the important part. It's written in natural language and tells the agent when and how to use the skill. No code required for the agent — it follows the instructions like, well, instructions.

## Writing your own

1. Create a folder in `~/.openclaw/workspace/skills/`
2. Add a `SKILL.md` with a name, description, and clear instructions
3. Done. The agent will find it on the next session.

Good skills are specific ("check DB train delays via bahn.de API") not vague ("help with travel"). The description is what the agent uses to decide if the skill is relevant to your request.

## Contributing

PRs welcome. If you built a skill that works well for you, share it. Keep the folder structure clean and the `SKILL.md` descriptive.

## License

MIT — do whatever you want with these.
