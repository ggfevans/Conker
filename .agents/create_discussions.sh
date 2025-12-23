#!/bin/bash

REPO_ID="R_kgDOQZtpnQ"

# Category IDs
ANNOUNCEMENTS="DIC_kwDOQZtpnc4C0IH5"
GENERAL="DIC_kwDOQZtpnc4C0IH6"
IDEAS="DIC_kwDOQZtpnc4C0IH8"
QA="DIC_kwDOQZtpnc4C0IH7"
SHOW_TELL="DIC_kwDOQZtpnc4C0IH9"

# 1. Welcome Discussion (Announcements)
echo "Creating Welcome discussion..."
gh api graphql -f query='
mutation {
  createDiscussion(input: {
    repositoryId: "'"$REPO_ID"'"
    categoryId: "'"$ANNOUNCEMENTS"'"
    title: "Welcome to ForkMonkey Discussions! 🐵🎉"
    body: "Hey there, monkey breeder!\n\nThis is the official place to:\n- 🎨 **Show off your monkey** - Share screenshots of your unique evolutions!\n- 💡 **Suggest new features** - What traits should we add next?\n- ❓ **Ask questions** - Stuck on setup? Need help?\n- 🧬 **Discuss breeding strategies** - How to get Legendary traits\n- 🏆 **Celebrate milestones** - Hit 100 days? Got a rare trait? Tell us!\n\n**Quick Links:**\n- [🎮 Live Demo](https://roeiba.github.io/forkMonkey/)\n- [🍴 Fork Your Monkey](https://github.com/roeiba/forkMonkey/fork)\n- [📖 README](https://github.com/roeiba/forkMonkey#readme)\n\nLet the evolution begin! 🚀"
  }) {
    discussion { url }
  }
}'

# 2. Show Off Your Monkey (Show and Tell)
echo "Creating Show Off discussion..."
gh api graphql -f query='
mutation {
  createDiscussion(input: {
    repositoryId: "'"$REPO_ID"'"
    categoryId: "'"$SHOW_TELL"'"
    title: "🐵 Show Off Your Monkey! ✨"
    body: "Bred something cool? Got a rare trait? Share your monkey here!\n\n**How to share:**\n1. Take a screenshot or link to your repo\n2. Describe your monkey'\''s best traits\n3. Share your evolution story!\n\n**Template:**\n> **My Monkey:** [link to your fork]\n> **Age:** [X] days\n> **Rarity Score:** [X]/100\n> **Coolest Traits:** [list]\n> **Streak:** [X] days\n> **Story:** [How did you get that legendary trait?]\n\n---\n\nI'\''ll start! 👇\n\nThe OG monkey at [roeiba/forkMonkey](https://github.com/roeiba/forkMonkey) - 28 days old with a Volcano background (RARE)! 🌋"
  }) {
    discussion { url }
  }
}'

# 3. Trait Wishlist (Ideas)
echo "Creating Trait Wishlist discussion..."
gh api graphql -f query='
mutation {
  createDiscussion(input: {
    repositoryId: "'"$REPO_ID"'"
    categoryId: "'"$IDEAS"'"
    title: "🎨 Trait Wishlist — What Should Our Monkeys Evolve?"
    body: "Got ideas for new monkey traits? Drop them here!\n\n**Current trait categories:**\n- 🎨 Colors & Patterns\n- 👓 Accessories\n- 🌍 Backgrounds\n- ✨ Effects & Auras\n\n**Examples to inspire you:**\n- 🌈 Rainbow gradient fur\n- 🎩 Top hat accessory\n- 🌙 Moon background\n- 👾 Glitch effect\n\n**Share your ideas!** The best suggestions might become official traits.\n\n**Format:**\n> **Trait Name:** [Name]\n> **Category:** Color/Accessory/Background/Effect\n> **Rarity:** Common/Uncommon/Rare/Legendary\n> **Description:** [How it looks]"
  }) {
    discussion { url }
  }
}'

# 4. FAQ (Q&A)
echo "Creating FAQ discussion..."
gh api graphql -f query='
mutation {
  createDiscussion(input: {
    repositoryId: "'"$REPO_ID"'"
    categoryId: "'"$QA"'"
    title: "❓ FAQ — Common Questions & Answers"
    body: "## Getting Started\n\n**Q: How do I get a monkey?**\nA: Fork this repo → Enable Actions → Run \"Initialize New Monkey\" workflow → Done! 🐵\n\n**Q: Is it really free?**\nA: Yes! 100% free forever. Uses GitHub'\''s free tier for everything.\n\n**Q: How does AI evolution work?**\nA: Every night, a GitHub Action runs GPT-4o (via GitHub Models) to decide how your monkey evolves.\n\n## Evolution & Breeding\n\n**Q: Can I speed up evolution?**\nA: Manual runs are possible via Actions, but daily evolution builds better streaks!\n\n**Q: How does breeding work?**\nA: When someone forks your repo, their monkey inherits ~50% of your traits with mutations.\n\n**Q: What are extinct traits?**\nA: Some legendary traits are only available in early generations (Gen 1-5). Fork early to get them!\n\n---\n\n*Have a question not covered here? Start a new discussion!*"
  }) {
    discussion { url }
  }
}'

# 5. Breeding Strategies (General)
echo "Creating Breeding Strategies discussion..."
gh api graphql -f query='
mutation {
  createDiscussion(input: {
    repositoryId: "'"$REPO_ID"'"
    categoryId: "'"$GENERAL"'"
    title: "🧬 Breeding Strategies — Tips to Get Legendary Traits"
    body: "Let'\''s share strategies for breeding the rarest monkeys!\n\n## Known Tips:\n\n### 🔥 Build Evolution Streaks\nKeep your monkey evolving daily to unlock:\n- 7 days → Week Warrior badge\n- 30 days → Diamond Hands\n- 100 days → Century Legend\n\n### 🏆 Fork Early Generations\nExtinct traits are gen-locked:\n- Gen 1 only: Genesis Aura 🏆\n- Gen 1-3: Alpha Crown 👑\n- Gen 1-5: Founders Badge ✨\n\n### 🎲 Multiple Forks = More Chances\nEach fork is a new roll of the genetic dice!\n\n---\n\n**What strategies have worked for you?** Share below! 👇"
  }) {
    discussion { url }
  }
}'

# 6. Troubleshooting Guide (Q&A)
echo "Creating Troubleshooting discussion..."
gh api graphql -f query='
mutation {
  createDiscussion(input: {
    repositoryId: "'"$REPO_ID"'"
    categoryId: "'"$QA"'"
    title: "🔧 Troubleshooting Guide"
    body: "Having issues? Check here first!\n\n## Common Issues\n\n### ❌ \"Workflow not running\"\n**Fix:** Go to Actions tab → Click \"I understand my workflows, go ahead and enable them\"\n\n### ❌ \"Monkey not appearing in README\"\n**Fix:** Run \"Initialize New Monkey\" workflow first, wait 1-2 minutes for commit\n\n### ❌ \"GitHub Pages not working\"\n**Fix:** Settings → Pages → Source: GitHub Actions\n\n### ❌ \"Evolution stopped\"\n**Possible causes:**\n- Workflow disabled\n- GitHub Actions quota exceeded (unlikely on free tier)\n- Check Actions tab for error logs\n\n---\n\n**Still stuck?** Start a new Q&A discussion with:\n1. Your repo link\n2. What you tried\n3. Error messages (if any)"
  }) {
    discussion { url }
  }
}'

echo "Done! 🐵"
