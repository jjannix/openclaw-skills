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
