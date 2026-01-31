# openclaw-skills

A collection of skills for [Clawdbot](https://github.com/clawdbot/clawdbot) - the extensible AI assistant.

## Skills

| Skill | Description | Status |
|-------|-------------|--------|
| [bahn](./bahn/) | Deutsche Bahn train delays and connections | ✅ Stable |

## Installation

### Option 1: Install Single Skill

```bash
git clone https://github.com/jjannix/openclaw-skills.git
cd openclaw-skills
cp -r bahn ~/clawd/skills/
cd .. && rm -rf openclaw-skills
```

### Option 2: Install Multiple Skills

```bash
git clone https://github.com/jjannix/openclaw-skills.git
cd openclaw-skills
cp -r bahn weather github ~/clawd/skills/
cd .. && rm -rf openclaw-skills
```

### Option 3: Sparse Checkout (Download Only What You Need)

```bash
git clone --no-checkout https://github.com/jjannix/openclaw-skills.git
cd openclaw-skills
git sparse-checkout set bahn
git checkout
mv bahn ~/clawd/skills/
cd .. && rm -rf openclaw-skills
```

## Using with Clawdbot

Once installed, your Clawdbot agent can use these skills immediately. The agent will automatically discover skills in its workspace and use them based on the skill descriptions in each `SKILL.md` file.

### How It Works

1. **Skill Discovery** - Clawdbot scans the `~/clawd/skills/` directory on startup
2. **Automatic Loading** - Each `SKILL.md` file provides instructions for the agent
3. **Context-Aware** - The agent uses skills when your requests match their descriptions

### Example Usage

After installing the `bahn` skill:

**You:** "Is the ICE 801 from Berlin to Munich on time?"

**Agent:** [Uses bahn skill to check real-time delays]

### Telling Your Agent About New Skills

If you've installed a new skill and your agent doesn't seem to be using it, you can explicitly tell your agent:

```
"I've installed the bahn skill in ~/clawd/skills/bahn/. You can now check Deutsche Bahn train delays and connections."
```

Your agent will read the skill's `SKILL.md` and know how to use it.

## Development

Each skill is self-contained with its own:
- `SKILL.md` - Documentation and usage instructions
- `scripts/` - Example scripts and utilities
- `references/` - API documentation and references

## Contributing

Contributions welcome! Please feel free to submit a Pull Request.

## License

MIT License - see [LICENSE](./LICENSE) for details.

## Credits

Built for the [Clawdbot](https://github.com/clawdbot/clawdbot) community.
