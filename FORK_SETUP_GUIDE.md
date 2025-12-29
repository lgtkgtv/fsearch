# Fork Setup and Maintenance Guide

## Step 1: Create Your Fork on GitHub

### Via GitHub Web Interface:
1. Go to: https://github.com/cboxdoerfer/fsearch
2. Click **"Fork"** button (top right)
3. Select your account as the destination
4. Wait for fork to complete (~30 seconds)
5. You now have: `https://github.com/YOUR_USERNAME/fsearch`

## Step 2: Add Your Fork as Remote

```bash
cd /home/s/fsearch

# Check current remotes
git remote -v

# Add your fork (replace YOUR_USERNAME)
git remote add fork https://github.com/YOUR_USERNAME/fsearch.git

# Verify
git remote -v
# Should show:
#   origin    https://github.com/cboxdoerfer/fsearch.git (fetch)
#   origin    https://github.com/cboxdoerfer/fsearch.git (push)
#   fork      https://github.com/YOUR_USERNAME/fsearch.git (fetch)
#   fork      https://github.com/YOUR_USERNAME/fsearch.git (push)
```

## Step 3: Create Feature Branch with Docker Support

```bash
# Create and switch to feature branch
git checkout -b add-docker-build-support

# Add your Docker files
git add Dockerfile docker-build.sh docs/DOCKER_BUILD.md

# Commit
git commit -m "Add Docker build support for isolated builds

- Add Dockerfile with Ubuntu 24.04 base
- Add automated docker-build.sh script
- Add comprehensive Docker build documentation
- Build runs as non-root user for security
- Includes all build dependencies and test execution

This enables users to build FSearch without installing
system dependencies, useful for testing and security-conscious
builds."

# Push to your fork
git push fork add-docker-build-support
```

## Step 4: Share in Discussion

In your GitHub discussion, add:

```markdown
### Implementation Available

I have a working implementation ready for review:
🔗 https://github.com/YOUR_USERNAME/fsearch/tree/add-docker-build-support

Files included:
- [Dockerfile](https://github.com/YOUR_USERNAME/fsearch/blob/add-docker-build-support/Dockerfile)
- [docker-build.sh](https://github.com/YOUR_USERNAME/fsearch/blob/add-docker-build-support/docker-build.sh)
- [docs/DOCKER_BUILD.md](https://github.com/YOUR_USERNAME/fsearch/blob/add-docker-build-support/docs/DOCKER_BUILD.md)

Tested successfully on Ubuntu 24.04 with Docker 27.5.1.
```

## Maintaining Your Fork

### Keep Your Fork Synced with Upstream

```bash
# Fetch latest changes from upstream
git fetch origin

# Switch to master branch
git checkout master

# Merge upstream changes
git merge origin/master

# Push updated master to your fork
git push fork master

# Update your feature branch with latest master
git checkout add-docker-build-support
git rebase master
git push fork add-docker-build-support --force-with-lease
```

### When to Sync

- **Before creating a new feature branch** - Start from latest code
- **Before submitting PR** - Ensure no conflicts
- **Weekly/Monthly** - If actively maintaining the fork
- **After upstream merges** - Keep current with project

## Fork Naming and Description

### Update Fork Description on GitHub:
1. Go to your fork: `https://github.com/YOUR_USERNAME/fsearch`
2. Click ⚙️ (settings) next to "About"
3. **Description**: "FSearch with Docker build support (fork for contribution)"
4. **Website**: Link to your discussion or upstream repo
5. **Topics**: Add tags like `docker`, `gtk`, `linux`, `file-search`
6. Check: ☑️ "Packages" if you publish any
7. Save changes

## Branch Strategy

### Recommended Branches:

```
master (or main)
  ↓ (sync with upstream regularly)
  ├── add-docker-build-support (feature branch)
  ├── experimental-features (testing)
  └── personal-customizations (your own tweaks)
```

### Branch Commands:

```bash
# Create new feature branch
git checkout master
git pull origin master
git checkout -b new-feature-name

# List branches
git branch -a

# Delete old feature branch (after merged)
git branch -d old-feature-name
git push fork --delete old-feature-name
```

## Working with Your Fork

### Daily Workflow:

```bash
# 1. Make changes to files
vim Dockerfile

# 2. Check what changed
git status
git diff

# 3. Stage changes
git add Dockerfile

# 4. Commit with clear message
git commit -m "Update Dockerfile to support Ubuntu 22.04 and 24.04"

# 5. Push to your fork
git push fork add-docker-build-support
```

### If Maintainer Requests Changes:

```bash
# Make the requested changes
vim docs/DOCKER_BUILD.md

# Commit changes
git add docs/DOCKER_BUILD.md
git commit -m "Address review feedback: improve installation docs"

# Push updated branch
git push fork add-docker-build-support

# The PR automatically updates!
```

## Fork Maintenance Long-term

### If Upstream Accepts Your PR:
```bash
# After merge, sync your master
git checkout master
git pull origin master
git push fork master

# Delete feature branch (no longer needed)
git branch -d add-docker-build-support
git push fork --delete add-docker-build-support
```

### If Upstream Doesn't Accept:
You can still maintain your fork with Docker support:

```bash
# Keep your feature branch updated
git checkout add-docker-build-support
git fetch origin
git rebase origin/master
git push fork add-docker-build-support --force-with-lease

# Others can use your fork
# They clone: git clone https://github.com/YOUR_USERNAME/fsearch.git
```

## Fork Visibility

### Make Your Fork Discoverable:

1. **README Badge** (optional):
   Add to your fork's README:
   ```markdown
   ## Docker Build Support
   This fork includes Docker build support. See [docs/DOCKER_BUILD.md](docs/DOCKER_BUILD.md).
   ```

2. **GitHub Topics**:
   Add: `docker`, `docker-build`, `isolated-build`

3. **Link in Profile**:
   Pin your fork to GitHub profile if it's your main contribution

## Collaboration

### If Others Want to Contribute to Your Fork:

```bash
# They fork YOUR fork
# Then submit PR to YOUR fork
# You can merge before proposing to upstream
```

## Security Note

### Keep Credentials Safe:
- Never commit API keys, passwords, or tokens
- Use `.gitignore` for sensitive files
- Review `git diff` before committing

### Recommended `.gitignore` additions:
```bash
# Add to .gitignore if not already there
*.env
*.secret
credentials.json
*.pem
*.key
```

## Quick Reference

```bash
# Sync fork with upstream
git fetch origin && git checkout master && git merge origin/master && git push fork master

# Update feature branch
git checkout add-docker-build-support && git rebase master && git push fork add-docker-build-support --force-with-lease

# Check status
git status && git log --oneline -5

# View remotes
git remote -v

# View branches
git branch -a
```

---

## Benefits Summary

### With a Fork You Can:
- ✅ Submit PRs (required workflow)
- ✅ Show working code to maintainers
- ✅ Keep using improvements while waiting for review
- ✅ Experiment safely
- ✅ Share with others
- ✅ Build portfolio of contributions
- ✅ Learn Git/GitHub workflow

### Fork Maintenance Time:
- **Initial setup**: 5 minutes
- **Regular updates**: 2-5 minutes/week
- **After PR merged**: Minimal (just sync occasionally)

---

**Ready to fork?** Just click the Fork button on GitHub and follow Step 2 above!
