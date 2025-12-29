# Discussion Posting Checklist

## Before Posting

### 1. Fork the Repository (Optional but Recommended)
This shows you're ready to contribute code if accepted.

- [ ] Go to: https://github.com/cboxdoerfer/fsearch
- [ ] Click "Fork" button (top right)
- [ ] Wait for fork to complete

### 2. Review Your Discussion Post
- [ ] Read `DISCUSSION_POST.md`
- [ ] Customize if needed (add your GitHub username, etc.)
- [ ] Check for typos

### 3. Have Files Ready to Share
If maintainer asks to see the code:
- [ ] Your fork URL ready
- [ ] Or create a gist with: Dockerfile, docker-build.sh, docs/DOCKER_BUILD.md

## Posting the Discussion

### Step 1: Navigate to Discussions
- [ ] Go to: https://github.com/cboxdoerfer/fsearch/discussions/new
- [ ] Or click: Discussions tab → New discussion

### Step 2: Select Category
- [ ] Choose: **"Ideas"** (or "General" if Ideas not available)

### Step 3: Fill in the Form
- [ ] **Title**: Copy from `DISCUSSION_POST.md`
- [ ] **Body**: Copy the entire body section from `DISCUSSION_POST.md`
- [ ] **Preview**: Click preview tab to check formatting

### Step 4: Post
- [ ] Click "Start discussion"
- [ ] Save the discussion URL for reference

## After Posting

### Monitor for Responses
- [ ] Check GitHub notifications daily
- [ ] Be patient (may take days or weeks for response)
- [ ] Enable email notifications for the discussion

### When Maintainer Responds

**If Positive Response:**
- [ ] Thank them for reviewing
- [ ] Ask if they want to see the code first (gist/branch)
- [ ] Address any questions or concerns
- [ ] Follow CONTRIBUTION_PLAN.md when ready for PR

**If Wants to See Code First:**
- [ ] Create a branch: `git checkout -b add-docker-build-support`
- [ ] Push to your fork: `git push fork add-docker-build-support`
- [ ] Share the branch URL

**If Requests Changes:**
- [ ] Take notes on requested changes
- [ ] Update files accordingly
- [ ] Respond with updated approach

**If Declined:**
- [ ] Thank them for considering
- [ ] Ask if there's a different approach they'd prefer
- [ ] You still learned a lot! Keep the files for your own use

### Response Templates

**If they ask to see the code:**
```
Thanks for the interest! I have the implementation ready:
- Dockerfile: [link to gist or fork]
- Build script: [link]
- Documentation: [link]

Would you like me to submit a draft PR for review, or would you prefer
to review the files first?
```

**If they have concerns:**
```
Thanks for the feedback! I completely understand your concerns about [X].

Would an alternative approach work better? For example:
- [Alternative 1]
- [Alternative 2]

Happy to adjust based on your preferences.
```

**If approved:**
```
Excellent! I'll prepare a PR with the implementation.

Just to confirm:
- Base image: Ubuntu [version]?
- File locations: [confirm locations]
- Any other requirements?

I'll submit the PR by [timeframe] and mark it ready for review.
```

## Tips for Good Discussion

### Do:
- ✅ Be respectful and professional
- ✅ Acknowledge existing packaging methods
- ✅ Show you've tested the implementation
- ✅ Be open to feedback and alternatives
- ✅ Thank maintainers for their time

### Don't:
- ❌ Pressure for quick response
- ❌ Act entitled to merge
- ❌ Criticize existing build methods
- ✅ Take rejection personally
- ❌ Argue if they decline

## Timeline Expectations

- **Immediate - 3 days**: Often maintainers will see and acknowledge
- **3-7 days**: Initial response typical for active projects
- **1-2 weeks**: Detailed review if interested
- **2+ weeks**: Normal for busy maintainers, be patient

No response after 3-4 weeks? Politely bump the discussion once.

## If You Need Help

Questions during the process:
1. Check project's Matrix room: https://matrix.to/#/#fsearch:matrix.org
2. Reference this discussion when asking questions
3. Be specific about what you need help with

---

**Ready?** Follow the checklist above and you're all set! 🚀

Good luck with your contribution!
