# Your First Pull Request - Complete Guide

**Congratulations!** You're about to contribute to open source! This guide will walk you through every step.

---

## What is a Pull Request (PR)?

A Pull Request is how you propose changes to someone else's project:
1. You make changes in your fork
2. You ask the maintainer to "pull" those changes into their project
3. They review, discuss, and potentially merge your changes

**Think of it like**: Suggesting edits to a shared document, but for code.

---

## Our Contribution Plan

### What We're Contributing:
1. **Docker Build Support** (main contribution)
   - Dockerfile
   - docker-build.sh
   - docs/DOCKER_BUILD.md

2. **Security Audit** (supporting documentation)
   - Comprehensive security audit report
   - Methodology documentation

---

## Step-by-Step Guide

### Phase 1: Organize Your Fork (Preserve All Work)

#### Step 1.1: Create a Documentation Branch
We'll keep all our analysis work in a separate branch in your fork.

```bash
cd /home/s/fsearch

# Create a new branch for documentation
git checkout -b security-audit-documentation

# Add all our analysis files
git add fsearch_static_analysis_howto.md
git add COMPREHENSIVE_SECURITY_AUDIT_REPORT.md
git add SECURITY_AUDIT_CRITIQUE.md
git add CONTRIBUTION_PLAN.md
git add DISCUSSION_POST.md
git add DISCUSSION_CHECKLIST.md
git add FORK_SETUP_GUIDE.md
git add GIT_AUTH_SETUP.md
git add FIRST_TIME_PR_GUIDE.md
git add run-security-audit.sh
git add security-audit-results/

# Commit everything
git commit -m "Add comprehensive security audit documentation

- Complete static analysis with Cppcheck and Flawfinder
- Detailed security audit report
- Methodology and findings documentation
- Audit automation scripts
- Contributing guidelines and guides"

# Push to your fork
git push fork security-audit-documentation
```

**Result**: All your work is preserved at:
`https://github.com/lgtkgtv/fsearch/tree/security-audit-documentation`

#### Step 1.2: Switch Back to Feature Branch
```bash
# Go back to the Docker build branch
git checkout add-docker-build-support
```

---

### Phase 2: Prepare the Discussion Post

We'll post a discussion first (before PR) to gauge interest.

#### Step 2.1: Update Discussion Post

Your updated discussion will include:
- Docker build proposal
- Link to working implementation
- Security audit summary
- Professional presentation

#### Step 2.2: Post the Discussion

1. **Go to**: https://github.com/cboxdoerfer/fsearch/discussions/new
2. **Category**: Select "Ideas"
3. **Copy content** from updated `DISCUSSION_POST.md`
4. **Click**: "Start discussion"

---

### Phase 3: Wait for Maintainer Response

**Expected Timeline**:
- 1-3 days: Initial acknowledgment (if active project)
- 1-2 weeks: Detailed feedback
- 2-4 weeks: Decision on whether to proceed

**Possible Responses**:

#### Response A: "This looks great! Submit a PR"
→ Proceed to Phase 4

#### Response B: "Interesting, but can you adjust X?"
→ Make adjustments, update branch, inform them

#### Response C: "We'd prefer a different approach"
→ Discuss alternatives, be flexible

#### Response D: "Not interested right now"
→ Thank them, keep using your fork

---

### Phase 4: Create the Pull Request (When Approved)

#### Step 4.1: Ensure Branch is Up-to-Date

```bash
# Fetch latest from upstream
git fetch origin

# Check if upstream master changed
git log origin/master..HEAD

# If upstream changed, rebase your branch
git rebase origin/master

# If conflicts occur:
# 1. Fix conflicts in files
# 2. git add <fixed-files>
# 3. git rebase --continue

# Push updated branch
git push fork add-docker-build-support --force-with-lease
```

#### Step 4.2: Create PR on GitHub

**Method 1: GitHub Web Interface** (Easiest)

1. **Go to your fork**: https://github.com/lgtkgtv/fsearch
2. **You'll see a yellow banner**: "add-docker-build-support had recent pushes"
3. **Click**: "Compare & pull request" button
4. **Or manually**:
   - Click "Pull requests" tab
   - Click "New pull request"
   - Click "compare across forks"
   - Base: `cboxdoerfer/fsearch` `master`
   - Head: `lgtkgtv/fsearch` `add-docker-build-support`
   - Click "Create pull request"

5. **Fill in the PR form**:

**Title:**
```
Add Docker build support for isolated builds
```

**Description:** (see template below)

**Method 2: Command Line** (Advanced)

```bash
# Install GitHub CLI (optional)
sudo apt install gh

# Authenticate
gh auth login

# Create PR
gh pr create --base master \
             --head lgtkgtv:add-docker-build-support \
             --title "Add Docker build support for isolated builds" \
             --body-file PR_DESCRIPTION.md
```

---

### Phase 5: The Review Process

#### What Happens After You Submit:

1. **Automated Checks Run**
   - CI/CD tests (if configured)
   - Maintainer gets notified

2. **Maintainer Reviews Your Code**
   - May take days/weeks
   - They'll leave comments/questions

3. **You Respond to Feedback**
   - Answer questions
   - Make requested changes
   - Push updates to same branch (PR updates automatically!)

#### How to Handle Review Comments:

**If maintainer says**: "Can you change X?"

```bash
# Make the changes in your local code
vim Dockerfile

# Commit the changes
git add Dockerfile
git commit -m "Address review feedback: update base image to Ubuntu 22.04"

# Push to your fork
git push fork add-docker-build-support

# The PR automatically updates!
```

**In PR discussion**:
```
Thanks for the feedback! I've updated the Dockerfile to use Ubuntu 22.04
as you suggested. Let me know if you'd like any other changes.
```

#### How to Handle Merge Conflicts:

If upstream master changes while your PR is open:

```bash
# Fetch latest
git fetch origin

# Rebase on latest master
git checkout add-docker-build-support
git rebase origin/master

# If conflicts:
# 1. Open conflicted files
# 2. Look for <<<<<<< HEAD markers
# 3. Resolve conflicts
# 4. git add <resolved-files>
# 5. git rebase --continue

# Force push (safe with --force-with-lease)
git push fork add-docker-build-support --force-with-lease
```

---

### Phase 6: PR Gets Merged! 🎉

#### What Happens:

1. **Maintainer clicks "Merge"**
   - Your changes are now in the upstream project!
   - Your name appears in contributors list
   - PR is closed as "merged"

2. **Your Fork**:
   ```bash
   # Update your master
   git checkout master
   git pull origin master
   git push fork master

   # Delete feature branch (optional, it's merged!)
   git branch -d add-docker-build-support
   git push fork --delete add-docker-build-support
   ```

3. **Celebrate!**
   - You're now an open-source contributor!
   - Add it to your resume/LinkedIn

---

## PR Description Template

Use this when creating your PR:

```markdown
## Summary
This PR adds Docker build support to FSearch, enabling users to build the application in an isolated container without installing build dependencies on their host system.

## Motivation
- Security: Build untrusted code in isolation
- Convenience: No manual dependency installation
- Reproducibility: Consistent build environment
- Testing: Easy to test on different distributions

## Changes
### New Files
- `Dockerfile` - Build environment with Ubuntu 24.04 base
- `docker-build.sh` - Automated build script with error handling
- `docs/DOCKER_BUILD.md` - Comprehensive documentation

### Features
- ✅ Builds as non-root user (security best practice)
- ✅ Includes all dependencies (GTK3, GLib, Meson, etc.)
- ✅ Runs tests as part of build
- ✅ Clean extraction of built binary
- ✅ Configurable base image (Ubuntu 22.04/24.04)

## Testing
**Environment:**
- Host: Ubuntu 24.04
- Docker: 27.5.1
- Build time: ~5-10 minutes (first time)

**Tested:**
```bash
./docker-build.sh
# Successfully builds FSearch 0.3.alpha0
# All tests pass
# Binary runs correctly
```

## Security Assessment
A comprehensive security audit was performed on the codebase before implementing Docker support:

**Tools Used:**
- Cppcheck 2.13.0 (static analysis)
- Flawfinder 2.0.19 (security scanner)
- Manual code review

**Results:**
- ✅ Zero security vulnerabilities identified
- ✅ No telemetry or network activity
- ✅ Dependencies current (GLib 2.80, GTK3 3.24, ICU 74, PCRE2 10.42)
- ✅ Proper input sanitization verified
- ✅ 19,025 lines analyzed

Full audit report available in fork: [security-audit-documentation branch](https://github.com/lgtkgtv/fsearch/tree/security-audit-documentation)

## Documentation
- Complete build guide in `docs/DOCKER_BUILD.md`
- Includes troubleshooting section
- Example usage for quick start and advanced scenarios

## Backwards Compatibility
- ✅ Non-breaking: Adds new build method, doesn't change existing ones
- ✅ Optional: Users can still build with meson/ninja
- ✅ Complements existing packaging (Flatpak, snap, distro repos)

## Additional Notes
- Docker image ~500MB (includes all build dependencies)
- Build artifacts can be cleaned up easily
- Suitable for CI/CD integration
- Can be adapted for other base images if needed

## Checklist
- [x] Tested on Ubuntu 24.04
- [x] Documentation complete
- [x] No breaking changes
- [x] Security audit performed
- [x] Ready for review

## Questions for Maintainers
1. Any preferences on file locations?
2. Should I add a GitHub Actions workflow for Docker builds?
3. Any other adjustments you'd like?

---

Happy to adjust based on your feedback! Thanks for considering this contribution.
```

---

## Common Mistakes to Avoid

### ❌ Don't:
1. **Force push without --force-with-lease**
   ```bash
   git push fork branch --force  # BAD - can lose data
   ```

2. **Commit directly to master**
   ```bash
   # BAD - always use feature branches
   git checkout master
   git commit -m "changes"
   ```

3. **Make unrelated changes**
   - Stick to Docker support only
   - Don't fix typos in unrelated files

4. **Argue with maintainers**
   - Be respectful and collaborative
   - Their project, their rules

5. **Spam with updates**
   - Wait for feedback before pushing fixes
   - Batch related changes

### ✅ Do:
1. **Use descriptive commit messages**
   ```bash
   git commit -m "Add Docker build support with Ubuntu 24.04 base"
   # Not: "fixed stuff"
   ```

2. **Keep commits logical**
   - One feature per commit (if large PR)
   - Or one commit for small PRs (like ours)

3. **Be patient**
   - Maintainers are volunteers
   - May take weeks to respond

4. **Be gracious**
   - Thank them for their time
   - Learn from feedback

5. **Test before submitting**
   - Verify everything works
   - Check for typos in docs

---

## Troubleshooting

### Problem: "Permission denied" when pushing

**Solution:**
```bash
# Check remote URL
git remote -v

# If HTTPS, you need a token
# Or switch to SSH:
git remote set-url fork git@github.com:lgtkgtv/fsearch.git
```

### Problem: "Merge conflict"

**Solution:**
```bash
git fetch origin
git rebase origin/master
# Resolve conflicts in files
git add <resolved-files>
git rebase --continue
git push fork branch --force-with-lease
```

### Problem: "PR shows wrong base"

**Solution:**
- Edit PR on GitHub
- Change base branch to `cboxdoerfer/fsearch:master`

### Problem: "Accidentally committed sensitive data"

**Solution:**
```bash
# Remove from history (use with caution!)
git filter-branch --tree-filter 'rm -f secret-file' HEAD
git push fork branch --force
```

---

## After Your First PR

### If Merged:
1. ✅ Update your resume/LinkedIn
2. ✅ Share on social media (optional)
3. ✅ Look for more contribution opportunities
4. ✅ Help others with their PRs

### If Not Merged:
1. ✅ You still learned Git/GitHub!
2. ✅ Keep the improvements in your fork
3. ✅ Share your fork with others
4. ✅ Try contributing to other projects

---

## Resources

### Learning More:
- GitHub PR Guide: https://docs.github.com/en/pull-requests
- Git Book: https://git-scm.com/book
- First Contributions: https://github.com/firstcontributions/first-contributions

### Getting Help:
- FSearch Matrix: https://matrix.to/#/#fsearch:matrix.org
- Git/GitHub Stack Overflow: https://stackoverflow.com/questions/tagged/git
- This guide! Read it again if needed

---

## Quick Reference

```bash
# Create documentation branch
git checkout -b security-audit-documentation
git add <analysis-files>
git commit -m "Add security audit documentation"
git push fork security-audit-documentation

# Return to feature branch
git checkout add-docker-build-support

# Update from upstream
git fetch origin
git rebase origin/master
git push fork add-docker-build-support --force-with-lease

# After changes requested
<make changes>
git add <changed-files>
git commit -m "Address review feedback: <what you changed>"
git push fork add-docker-build-support

# After merge
git checkout master
git pull origin master
git push fork master
git branch -d add-docker-build-support
```

---

**Ready?** Let's do this! 🚀

Your first contribution to open source is just a few steps away!
