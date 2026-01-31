#!/bin/bash
# openclaw-skills installer
# Usage: ./install.sh skill1 skill2 skill3

set -e

REPO_URL="https://github.com/jjannix/openclaw-skills.git"
INSTALL_DIR="${CLAWDBOT_SKILLS_DIR:-$HOME/.clawdbot/skills}"
BRANCH="${CLAWDBOT_SKILLS_BRANCH:-main}"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "🚀 openclaw-skills installer"
echo "================================"

# Check if skills directory exists
if [ ! -d "$INSTALL_DIR" ]; then
  echo -e "${YELLOW}Creating skills directory: $INSTALL_DIR${NC}"
  mkdir -p "$INSTALL_DIR"
fi

# Check if skills were specified
if [ $# -eq 0 ]; then
  echo -e "${RED}Error: No skills specified${NC}"
  echo "Usage: $0 skill1 skill2 ..."
  echo ""
  echo "Available skills:"
  echo "  - bahn (Deutsche Bahn delays)"
  exit 1
fi

# Create temp directory for cloning
TMP_DIR=$(mktemp -d)
trap "rm -rf $TMP_DIR" EXIT

echo "📦 Cloning repository to temp directory..."
git clone --depth 1 --branch "$BRANCH" "$REPO_URL" "$TMP_DIR" > /dev/null 2>&1

cd "$TMP_DIR"

# Install each skill
for skill in "$@"; do
  if [ -d "$skill" ]; then
    echo -e "${GREEN}✓ Installing $skill...${NC}"
    cp -r "$skill" "$INSTALL_DIR/"

    # Check if dependencies need to be installed
    if [ -f "$skill/package.json" ]; then
      echo "  → Installing dependencies for $skill..."
      cd "$INSTALL_DIR/$skill"
      npm install > /dev/null 2>&1 || echo -e "${YELLOW}  ⚠ Skipped npm install (run manually in $INSTALL_DIR/$skill)${NC}"
      cd "$TMP_DIR"
    fi
  else
    echo -e "${RED}✗ Skill '$skill' not found${NC}"
    AVAILABLE=$(ls -d */ 2>/dev/null | sed 's/\///g')
    if [ -n "$AVAILABLE" ]; then
      echo "  Available skills: $AVAILABLE"
    fi
  fi
done

echo ""
echo -e "${GREEN}✓ Installation complete!${NC}"
echo "Skills installed to: $INSTALL_DIR"
echo ""
echo "You may need to restart Clawdbot to load the new skills."
